# Vibing on an AMD MI300

This directory contains configuration files for running various language models on AMD MI300 GPUs via AMD Developer Cloud. Unfortunately, this experiment was discontinued due to running out of AMD Developer Cloud credits.

## Directory Structure

```
model_setup/
├── docker-compose.yml      # Main orchestration file for all model services
├── dockerfiles/           # Model-specific Dockerfile configurations
│   ├── base.Dockerfile    # Base image with common dependencies
│   ├── codellama7b.Dockerfile
│   ├── llama2-13b.Dockerfile
│   ├── mistral7b.Dockerfile
│   ├── mistral7b_4bit.Dockerfile
│   ├── mixtral.Dockerfile
│   ├── phi2.Dockerfile
│   ├── phi4_4bit.Dockerfile
│   ├── qwen.Dockerfile
│   └── qwen3_14b.Dockerfile
├── old/                   # Legacy Dockerfile configurations
└── test_endpoints.sh      # Script to verify model endpoint functionality
```

## Deployed Models

| Port | Model | Version/Checkpoint | Quantization | Memory Usage |
|------|-------|-------------------|--------------|--------------|
| 8000 | Llama 2 | meta-llama/Llama-2-13b-chat-hf | INT8 | 10.4% |
| 8001 | Mistral | mistralai/Mistral-7B-Instruct-v0.2 | FP16 | 10.4% |
| 8002 | CodeLlama | codellama/CodeLlama-7b-Instruct-hf | INT8 | 5.7% |
| 8003 | Phi-2 | microsoft/phi-2 | FP16 | 4.7% |
| 8004 | Qwen | Qwen/Qwen-7B-Chat | INT4 | 3.6% |
| 8005 | Mixtral | mistralai/Mixtral-8x7B-Instruct-v0.1 | INT4 | 17.7% |
| 8006 | Qwen3 | abhishekchohan/Qwen3-14B-AWQ | AWQ | 9.5% |
| 8007 | Phi-4 | microsoft/phi-4-mini-instruct | INT4 | 2.8% |

### Quantization Details
- INT8: 8-bit integer quantization
- INT4: 4-bit integer quantization
- FP16: 16-bit floating point (no quantization)
- AWQ: Activation-aware Weight Quantization

Total GPU memory utilization across all models: 64.8%

### Model Access
All models are running as vLLM API servers and can be accessed via HTTP at:
```http
http://localhost:<PORT>/v1/completions
```

## Components

### docker-compose.yml
Orchestrates the deployment of multiple model services, handling networking, resource allocation, and container management for the AMD MI300 environment.

### Dockerfiles
Located in the `dockerfiles/` directory, each Dockerfile represents a specific model configuration:

- `base.Dockerfile`: Common base image with shared dependencies
- Model-specific Dockerfiles for:
  - CodeLlama 7B
  - LLaMA 2 13B
  - Mistral 7B (including 4-bit quantized version)
  - Mixtral
  - Phi-2
  - Phi-4 (4-bit quantized)
  - Qwen
  - Qwen3 14B

### Testing
- `test_endpoints.sh`: Utility script to verify the functionality of deployed model endpoints

### Legacy Files
- The `old/` directory contains previous iterations of Dockerfile configurations that are kept for reference

## AMD MI300 Context
This setup was specifically designed to run on AMD MI300 GPUs through AMD Developer Cloud. The experiment aimed to leverage the high-performance computing capabilities of MI300 accelerators for running various language models. While there are some issues with compatibility with the ROCm framework, we were able to get several models running, exploring quantisation and optimisation. However, the project was discontinued when the allocated AMD Developer Cloud credits were exhausted.

## Note
This configuration is specifically tailored for AMD MI300 hardware and may require modifications to run on different GPU architectures or cloud environments. 