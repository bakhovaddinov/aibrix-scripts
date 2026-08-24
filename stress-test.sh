for i in {1..50}; do
  curl -s -X POST http://<YOUR_ENVOY_IP>:<PORT>/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "qwen257",
    "messages": [{"role": "user", "content": "Write a highly detailed, 1000-word essay about the history and construction of the ukulele."}],
    "max_tokens": 512
  }' > /dev/null &
done
wait
echo "Spike complete."
