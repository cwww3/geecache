#!/bin/bash
trap "rm server;kill 0" EXIT # trap 命令用于在 shell 脚本退出时，删掉临时文件，结束子进程。

go build -o server
./server -port=8001 &
./server -port=8002 &
./server -port=8003 -api=1 &

sleep 2
echo ">>> start test"
curl "http://localhost:8888/api?key=Tom" &
curl "http://localhost:8888/api?key=Tom" &
curl "http://localhost:8888/api?key=Tom" &

wait