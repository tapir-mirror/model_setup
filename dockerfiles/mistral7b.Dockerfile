FROM vllm-base:latest

EXPOSE 8001

CMD [ \
  "python", "-m", "vllm.entrypoints.api_server", \
  "--model", "mistralai/Mistral-7B-Instruct-v0.2", \
  "--host", "0.0.0.0", \
  "--port", "8001", \
  "--trust-remote-code" \
]