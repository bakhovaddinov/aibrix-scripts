echo "Initiating sustained barrage..."
for i in {1..100}; do
  (
    while true; do
      curl -s -X POST http://localhost:8000/v1/chat/completions \
      -H "Content-Type: application/json" \
      -d '{"model": "qwen257", "messages": [{"role": "user", "content": "Say hi."}], "max_tokens": 10}' > /dev/null
    done
  ) &
  pids[${i}]=$!
done

echo "Holding 20 concurrent connections open for 60 seconds... Check optimizer logs NOW!"
sleep 60
kill ${pids[*]} 2>/dev/null
echo "Barrage complete. Loops killed."
