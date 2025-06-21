FROM vllm-base:latest

EXPOSE 8006

CMD [ \
  "python", "-m", "vllm.entrypoints.api_server", \
  "--model", "abhishekchohan/Qwen3-14B-AWQ", \
  "--host", "0.0.0.0", \
  "--port", "8006", \
  "--gpu-memory-utilization", "0.095", \
  "--quantization", "awq" \
] 