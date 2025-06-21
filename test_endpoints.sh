#!/bin/bash

# Test function for each endpoint
test_endpoint() {
    local port=$1
    local model_name=$2
    echo "Testing $model_name on port $port..."
    
    curl -X POST http://localhost:$port/generate \
        -H "Content-Type: application/json" \
        -d '{
            "prompt": "Write a haiku about AI:",
            "max_tokens": 50,
            "temperature": 0.7,
            "stream": false
        }' | jq .
    echo -e "\n-----------------------------------\n"
}

# Test all endpoints
test_endpoint 8003 "Phi-2"
test_endpoint 8004 "Qwen"
test_endpoint 8000 "Llama-2-13B"
test_endpoint 8001 "Mistral-7B"
test_endpoint 8002 "CodeLlama-7B"
test_endpoint 8005 "Mixtral-8x7B"
test_endpoint 8006 "Qwen3-14B"
test_endpoint 8007 "Phi-4" 