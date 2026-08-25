while true; do
  curl -s -X POST http://localhost:31753/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "qwen257",
    "messages": [{"role": "user", "content": "Explain distributed systems."}],
    "max_tokens": 100,
    "stream": true,
    "stream_options": {"include_usage": true}
  }' > /dev/null
done
