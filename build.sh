#!/bin/bash

max_retry_count=1 # リトライ回数
retry_interval=5    # リトライ間隔（秒）

retry_count=0
while true; do
  # your_command -> 実行したいコマンド
  docker compose build && break

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
