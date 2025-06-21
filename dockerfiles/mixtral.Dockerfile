FROM vllm-base:latest

EXPOSE 8005

CMD [ \
  "python", "-m", "vllm.entrypoints.api_server", \
  "--model", "mistralai/Mixtral-8x7B-Instruct-v0.1", \
  "--host", "0.0.0.0", \
  "--port", "8005", \
  "--trust-remote-code" \
] 