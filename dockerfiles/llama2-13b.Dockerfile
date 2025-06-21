FROM vllm-base:latest

EXPOSE 8000

CMD [ \
  "python", "-m", "vllm.entrypoints.api_server", \
  "--model", "meta-llama/Llama-2-13b-chat-hf", \
  "--host", "0.0.0.0", \
  "--port", "8000", \
  "--trust-remote-code" \
]
