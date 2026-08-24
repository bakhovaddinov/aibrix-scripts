echo "Hammering the gateway..."
end=$((SECONDS+60))
while [ $SECONDS -lt $end ]; do
  curl -s -X POST http://<YOUR_ENVOY_IP>:<PORT>/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{"model": "qwen257", "messages": [{"role": "user", "content": "Say hi."}], "max_tokens": 10}' > /dev/null &
  sleep 0.2
done
wait
echo "Spike complete."
