COMPOSE_DOCKER_CLI_BUILD=1
DOCKER_BUILDKIT=1

max_retry_count=100 # リトライ回数
retry_interval=1 # リトライ間隔（秒）

retry_count=0
while true; do
  # your_command -> 実行したいコマンド
  docker compose build --parallel && break

  # リトライ回数が上限に達している場合は、エラーメッセージを出力してリトライ終了
  retry_count=$((retry_count + 1))
  if [ $retry_count -eq $max_retry_count ]; then
    echo "Error: command failed after $max_retry_count attempts"
    break
  fi

  # 待機
  echo "Command failed. Retrying in $retry_interval seconds..."
  sleep $retry_interval
done
