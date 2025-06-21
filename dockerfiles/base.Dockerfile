# dockerfiles/base.Dockerfile

# Use the official ROCm vLLM image
FROM rocm/vllm:latest

# Set environment variables
ENV ROCM_HOME=/opt/rocm
ENV PATH=$PATH:/opt/rocm/bin:/opt/rocm/opencl/bin
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/rocm/lib:/opt/rocm/opencl/lib

# Set a working directory inside the container
WORKDIR /app

# Install additional dependencies
RUN pip install --no-cache-dir transformers accelerate einops

# This base image doesn't need a CMD, as the model-specific
# Dockerfiles will provide their own.