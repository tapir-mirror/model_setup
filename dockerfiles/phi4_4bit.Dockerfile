FROM vllm-base:latest

EXPOSE 8007

CMD [ \
  "python", "-m", "vllm.entrypoints.api_server", \
  "--model", "microsoft/phi-4-mini-instruct", \
  "--host", "0.0.0.0", \
  "--port", "8007", \
  "--gpu-memory-utilization", "0.028", \
  "--quantization", "int4" \
] 