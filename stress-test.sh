echo "Firing sustained moderate load..."
for i in {1..4}; do
  (
    while true; do
      curl -s -X POST http://<YOUR_ENVOY_IP>:<PORT>/v1/chat/completions \
      -H "Content-Type: application/json" \
      -d '{
        "model": "qwen257",
        "messages": [{"role": "user", "content": "Write a short paragraph about cloud computing."}],
        "max_tokens": 300
      }' > /dev/null
    done
  ) &
  pids[${i}]=$!
done

sleep 30
kill ${pids[*]} 2>/dev/null
echo "Load test stopped."
