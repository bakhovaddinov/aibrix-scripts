for i in {1..4}; do
  (
    while true; do
      curl -s -X POST http://localhost:31753/v1/chat/completions \
      -H "Content-Type: application/json" \
      -d '{
        "model": "qwen257",
        "messages": [{"role": "user", "content": "Explain the architecture of distributed operating systems in detail."}],
        "max_tokens": 350
      }' > /dev/null
    done
  ) &
  pids[${i}]=$!
done

echo "Holding 4 active streams open..."
sleep 45
kill ${pids[*]} 2>/dev/null
