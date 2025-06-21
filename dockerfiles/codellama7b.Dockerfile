FROM vllm-base:latest

EXPOSE 8002

CMD [ \
  "python", "-m", "vllm.entrypoints.api_server", \
  "--model", "codellama/CodeLlama-7b-instruct-hf", \
  "--host", "0.0.0.0", \
  "--port", "8002", \
  "--trust-remote-code" \
] 