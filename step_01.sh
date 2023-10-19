#!/bin/bash
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sleep 20
docker pull artifriends/saseul-network:latest
sleep 10

docker run -d --init --name saseul-node80 -p 80:80 -v /var/saseul-data80:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node81 -p 81:80 -v /var/saseul-data81:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node82 -p 82:80 -v /var/saseul-data82:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node83 -p 83:80 -v /var/saseul-data83:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node84 -p 84:80 -v /var/saseul-data84:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node85 -p 85:80 -v /var/saseul-data85:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node86 -p 86:80 -v /var/saseul-data86:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node88 -p 88:80 -v /var/saseul-data88:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node89 -p 89:80 -v /var/saseul-data89:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node90 -p 90:80 -v /var/saseul-data90:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node91 -p 91:80 -v /var/saseul-data91:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node92 -p 92:80 -v /var/saseul-data92:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node93 -p 93:80 -v /var/saseul-data93:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node94 -p 94:80 -v /var/saseul-data94:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node96 -p 96:80 -v /var/saseul-data96:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node97 -p 97:80 -v /var/saseul-data97:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node98 -p 98:80 -v /var/saseul-data98:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node99 -p 99:80 -v /var/saseul-data99:/var/saseul/saseul-network/data artifriends/saseul-network:latest
sleep 2
docker run -d --init --name saseul-node100 -p 100:80 -v /var/saseul-data100:/var/saseul/saseul-network/data artifriends/saseul-network:latest
