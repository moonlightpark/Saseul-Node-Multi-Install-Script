#!/bin/bash --login

SPORT=80       # 80포트부터 시작하기 위해서
NODE_TNO=0     # 멀티노드 개수

NODES=$(seq 80 $((80 + $NODE_TNO + 1)))


for i in $NODES
do
  if [[ $i == "87" ]]; then
    continue
  fi
  if [[ $i == "95" ]]; then
    continue
  fi

  echo "$(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S) - $i 노드실행 점검"

  sudo docker exec -i saseul-node$i saseul-script start
  sleep 3
  sudo docker exec -i saseul-node$i saseul-script startmining
done
