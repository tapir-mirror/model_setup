FROM vllm-base:latest

EXPOSE 8003

CMD [ \
  "python", "-m", "vllm.entrypoints.api_server", \
  "--model", "microsoft/phi-2", \
  "--host", "0.0.0.0", \
  "--port", "8003", \
  "--trust-remote-code", \
  "--device", "rocm" \
] 