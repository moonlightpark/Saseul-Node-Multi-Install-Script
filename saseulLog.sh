#!/bin/bash

NODE_NO=19

NODES=$(seq 80 $((80 + $NODE_NO + 1)))

for i in $NODES
do
  if [[ $i == "87" ]]; then
    continue
  fi
  if [[ $i == "95" ]]; then
    continue
  fi

  A=$(docker exec -i saseul-node$i saseul-script log )
  echo "**********"
  echo "Node $i Port: ""$A"
  echo "**********"
  sleep 1
  ((number++))
done

echo "*******************************************************************"
echo "${foods[@]}"
echo "*******************************************************************"
