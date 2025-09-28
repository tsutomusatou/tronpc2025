#include <stdint.h>
#include <math.h>
#include <string.h>

#include "common_utils.h"
#include "tflm_runner.h"

#include "../tflm/tensorflow/lite/schema/schema_generated.h"
#include "../tflm/tensorflow/lite/micro/micro_interpreter.h"
#include "../tflm/tensorflow/lite/micro/micro_mutable_op_resolver.h"
#include "../tflm/tensorflow/lite/micro/micro_log.h"
#include "../tflm/tensorflow/lite/micro/debug_log.h"
#include "tensorflow/lite/micro/system_setup.h"

#include "micro_speech_model_data.h"
#include "audio_preprocessor_int8.h"
#include "yesno_labels.h"

/* For audio preprocessor */
constexpr int kTensorArenaSize_preproc = 12 * 1024;

__attribute__((aligned(16))) static uint8_t tensor_arena_preproc[kTensorArenaSize_preproc];
//__attribute__((aligned(16), section(".tensor_arena_preproc"))) static uint8_t tensor_arena_preproc[kTensorArenaSize_preproc];


static tflite::MicroInterpreter* interpreter_preproc = nullptr;
static TfLiteTensor* g_input_preproc = nullptr;
static TfLiteTensor* g_output_preproc = nullptr;

/* For yes/no inference */
constexpr int kTensorArenaSize = 12 * 1024;

__attribute__((aligned(16))) static uint8_t tensor_arena[kTensorArenaSize];
//__attribute__((aligned(16), section(".tensor_arena_infer"))) static uint8_t tensor_arena[kTensorArenaSize];


static tflite::MicroInterpreter* interpreter = nullptr;
static TfLiteTensor* g_input_inference = nullptr;
static TfLiteTensor* g_output_inference = nullptr;

#define SAMPLE_RATE     16000
#define FRAME_LEN       480     /* 30ms/1frame = 480samples */
#define FRAME_SHIFT     320     /* 20ms = 320samples */

// Input size = 49 x 40 --> 1960
#define NUM_FRAMES         49
#define AUDIO_FEATURE_SIZE 40

static int8_t preprocessed_data[NUM_FRAMES][AUDIO_FEATURE_SIZE];

/* Inference result */
int yesno = -1;

static void audio_preprocess(const int16_t *frame, int8_t *preprocess_out) {
    for (size_t i = 0; i < FRAME_LEN; i++) {
        g_input_preproc->data.i16[i] = frame[i];
    }

    if (interpreter_preproc->Invoke() != kTfLiteOk) {
        SEGGER_RTT_printf(0, "Model invoke failed\r\n");
        return;
    }

    for (size_t i = 0; i < AUDIO_FEATURE_SIZE; i++) {
        preprocess_out[i] = g_output_preproc->data.int8[i];
    }
}

void run_yesno_inference() {
    /* Copy audio data to model input */
    int input_index = 0;

    for (int f = 0; f < NUM_FRAMES; f++) {
        for (int c = 0; c < AUDIO_FEATURE_SIZE; c++) {
            g_input_inference->data.int8[input_index++] = preprocessed_data[f][c];
        }
    }

    /* Execute inference */
    if (interpreter->Invoke() != kTfLiteOk) {
        SEGGER_RTT_printf(0, "Yes/No model invoke failed\r\n");
        return;
    }


    /* Display inference result */
    const int8_t* scores = g_output_inference->data.int8;
    float yes_score_f = (scores[2] - g_output_inference->params.zero_point) * g_output_inference->params.scale;
    float no_score_f = (scores[3] - g_output_inference->params.zero_point) * g_output_inference->params.scale;
    if ((yes_score_f*1000) > 100) {
//        SEGGER_RTT_printf(0, "yes\n");
        yesno = 1;
    } else if ((no_score_f*1000) > 100) {
//        SEGGER_RTT_printf(0, "no\n");
        yesno = 0;
    } else {
//        SEGGER_RTT_printf(0, ".\n");
        yesno = -1;
    }
}

static void show_tensor_info(TfLiteTensor* input_tensor) {
    SEGGER_RTT_printf(0, "[TFLM] Setup complete. Input size = %d bytes\n", input_tensor->bytes);
    SEGGER_RTT_printf(0, "[TFLM] input tensor ptr = %p\r\n", input_tensor->data.int8);
    SEGGER_RTT_printf(0, "[TFLM] input tensor type = %d\r\n", input_tensor->type);
    SEGGER_RTT_printf(0, "[TFLM] input tensor bytes = %d\r\n", input_tensor->bytes);
    SEGGER_RTT_printf(0, "[TFLM] dims->size = %d\n", input_tensor->dims->size);
    for (int i = 0; i < input_tensor->dims->size; i++) {
        SEGGER_RTT_printf(0, "[TFLM] dim[%d] = %d\n", i, input_tensor->dims->data[i]);
    }
}

static void audio_preprocessor_init(void) {
    /* Get model of audio preprocessor */
    const tflite::Model* model = tflite::GetModel(g_audio_preprocessor_int8);
    if (model->version() != TFLITE_SCHEMA_VERSION)
    {
        SEGGER_RTT_printf(0, "[TFLM] model version is not correct.\n");
        return;
    }

#if 0 // For debug
    auto subgraphs = model->subgraphs();
    if (!subgraphs || subgraphs->size() == 0) {
        SEGGER_RTT_printf(0, "Model has no subgraphs");
    }

    auto subgraph = subgraphs->Get(0);
    if (!subgraph->operators() || subgraph->operators()->size() == 0) {
        SEGGER_RTT_printf(0, "Subgraph has no operators");
    }

    for (int i = 0; i < subgraph->operators()->size(); ++i) {
        auto op = subgraph->operators()->Get(i);
        int opcode_index = op->opcode_index();
        auto opcode = model->operator_codes()->Get(opcode_index);
        SEGGER_RTT_printf(0, "Op[%d]: BuiltinCode = %d\n", i, opcode->builtin_code());
    }
#endif  // For debug

    SEGGER_RTT_printf(0, "[TFLM] Model for preproc loaded. Version: %d\n", model->version());

    /* Register necessary operators. Num of operators is 18. */
    static tflite::MicroMutableOpResolver<18> op_resolver;
    op_resolver.AddReshape();
    op_resolver.AddCast();
    op_resolver.AddStridedSlice();
    op_resolver.AddConcatenation();
    op_resolver.AddMul();
    op_resolver.AddAdd();
    op_resolver.AddDiv();
    op_resolver.AddMinimum();
    op_resolver.AddMaximum();
    op_resolver.AddWindow();
    op_resolver.AddFftAutoScale();
    op_resolver.AddRfft();
    op_resolver.AddEnergy();
    op_resolver.AddFilterBank();
    op_resolver.AddFilterBankSquareRoot();
    op_resolver.AddFilterBankSpectralSubtraction();
    op_resolver.AddPCAN();
    op_resolver.AddFilterBankLog();

    SEGGER_RTT_printf(0, "[TFLM] Register resolvers\n");

    /* Create interpreter for audio preprocessor */
    static tflite::MicroInterpreter static_interpreter(
        model, op_resolver, tensor_arena_preproc, kTensorArenaSize_preproc, nullptr);
    interpreter_preproc = &static_interpreter;

    SEGGER_RTT_printf(0, "[TFLM] Allocate tensors\n");

    if (interpreter_preproc->AllocateTensors() != kTfLiteOk)
    {
        SEGGER_RTT_printf(0, "[TFLM] Tensor allocation failed\n");
        return;
    }

    size_t used_bytes = interpreter_preproc->arena_used_bytes();
    SEGGER_RTT_printf(0, "[TFLM] Preproc arena used: %d bytes\n", used_bytes);

    g_input_preproc = interpreter_preproc->input(0);
    g_output_preproc = interpreter_preproc->output(0);

    show_tensor_info(g_input_preproc);
}


static void inference_init(void) {
    /* Get model for inference */
    const tflite::Model* model = tflite::GetModel(g_micro_speech_model_data);
    if (model->version() != TFLITE_SCHEMA_VERSION)
    {
        SEGGER_RTT_printf(0, "[TFLM] model version is not correct.\n");
        return;
    }

    SEGGER_RTT_printf(0, "[TFLM] Model for inference loaded. Version: %d\n", model->version());

    /* Register necessary operators. Num of operators is 6. */
    static tflite::MicroMutableOpResolver<6> resolver;
    resolver.AddFullyConnected();
    resolver.AddSoftmax();
    resolver.AddReshape();
    resolver.AddQuantize();   // May not be needed ?
    resolver.AddDequantize(); // May not be needed ?
    resolver.AddDepthwiseConv2D();

    SEGGER_RTT_printf(0, "[TFLM] Register resolvers\n");

    /* Create interpreter for inference */
    static tflite::MicroInterpreter static_interpreter(
        model, resolver, tensor_arena, kTensorArenaSize, nullptr);
    interpreter = &static_interpreter;
    if (interpreter->AllocateTensors() != kTfLiteOk)
    {
        SEGGER_RTT_printf(0, "[TFLM] Tensor allocation failed\n");
        return;
    }

    size_t used_bytes = interpreter->arena_used_bytes();
    SEGGER_RTT_printf(0, "[TFLM] Inference arena used: %d bytes\n", used_bytes);

    g_input_inference = interpreter->input(0);
    g_output_inference = interpreter->output(0);

    show_tensor_info(g_input_inference);
}

extern "C" void tflm_setup(void)
{
    tflite::InitializeTarget();

    SEGGER_RTT_printf(0, "[TFLM] Setup start\n");

    audio_preprocessor_init();
    inference_init();

    SEGGER_RTT_printf(0, "[TFLM] Setup end\n");
}

extern "C" void tflm_predict(const int16_t* audio_input, size_t length)
{
    // audio preprocess
    int frame_index = 0;
//    int result = -1;

    for (int start = 0; start + FRAME_LEN <= SAMPLE_RATE; start += FRAME_SHIFT) {
        audio_preprocess(&audio_input[start], preprocessed_data[frame_index]);
        frame_index++;
        if (frame_index >= NUM_FRAMES) break;
    }

    // Inference
    run_yesno_inference();
}
