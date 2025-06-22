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
├── models.md              # Model specifications and requirements
├── old/                   # Legacy Dockerfile configurations
└── test_endpoints.sh      # Script to verify model endpoint functionality
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

### Documentation
- `models.md`: Contains detailed specifications for each model, including resource requirements and configuration details

### Legacy Files
- The `old/` directory contains previous iterations of Dockerfile configurations that are kept for reference

## AMD MI300 Context
This setup was specifically designed to run on AMD MI300 GPUs through AMD Developer Cloud. The experiment aimed to leverage the high-performance computing capabilities of MI300 accelerators for running various language models. While there are some issues with compatibility with the ROCm framework, we were able to get several models running, exploring quantisation and optimisation. However, the project was discontinued when the allocated AMD Developer Cloud credits were exhausted.

## Note
This configuration is specifically tailored for AMD MI300 hardware and may require modifications to run on different GPU architectures or cloud environments. 