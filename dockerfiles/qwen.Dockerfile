FROM vllm-base:latest

EXPOSE 8004

CMD [ \
  "python", "-m", "vllm.entrypoints.api_server", \
  "--model", "Qwen/Qwen-7B-Chat", \
  "--host", "0.0.0.0", \
  "--port", "8004", \
  "--trust-remote-code" \
] 