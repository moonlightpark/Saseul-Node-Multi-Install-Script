#!/bin/bash

clear
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::::::::::::::::::::::::::::::::: 기초정보 입력 ::::::::::::::::::::::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#:: 채굴된 사슬코인을 받을 노드별 지갑주소 입력 ::
WalletAddress1='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
WalletAddress2='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
WalletAddress3='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
WalletAddress4='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
WalletAddress5='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
WalletAddress6='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
WalletAddress7='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
WalletAddress8='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
WalletAddress9='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
WalletAddress10='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

#:: 공인 IP 입력 ::
IpAddress='1.1.1.1'

#:: 멀티노드 포트번호 입력 ::
PortAddress1=80
PortAddress2=81
PortAddress3=82
PortAddress4=83
PortAddress5=84
PortAddress6=85
PortAddress7=86
PortAddress8=87
PortAddress9=88
PortAddress10=89

#:: 블록데이터를 받아올 타겟노드 입력 ::
PeerNodeAddress='main.saseul.net'


echo "□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□"
echo "□□□□□□□□□□□□□□■■■■■■■■□□□□□□□□□□□■■□□□□■■■■■■■■□□"
echo "□□□□□■■□□□□□□□■■□□□□□□□□□■■■■■■□□■■□□□□■■■■■■■■■□"
echo "□□□□□■■□□□□□□□■■□□□□□□□□□□□□□■■□□■■□□□■■□□□□□□■■□"
echo "□□□□■■■■□□□□□□■■□□□□□□□□□□□□■■■□□■■□□□□■■■■■■■■■□"
echo "□□□■■■■■■□□□□□■■■■■■■■■□□□□□■■□□□■■□□□□■■■■■■■■□□"
echo "□■■■■□□■■■■□□□□□□□□□□□□□□□□■■■□□□■■■□□□□□□□□□□□□□"
echo "□■■■□■■□■■■□■■■■■■■■■■■■□□■■■■■□□■■□□□□□□□□□□□□□□"
echo "□□□□□■■□□□□□□□□□□□□□□□□□■■■■□■■■□■■□□■■■■■■■■■■■■"
echo "□□□□□■■□□□□□□■■■■■■■■■□□■■■□□□■■□■■□□□□□■■□□■■□□□"
echo "■■■■■■■■■■■■□□□□□□□□□■■□□□□□□□□□□■■□□□□□■■□□■■□□□"
echo "□□□□□□□□□□□□□□□□□□□□□■■□□□□□□□□□□■■□□□□□■■□□■■□□□"
echo "□□□□□□□□□□□□□□□□□□□□□■■□□□□□□□□□□■■□□□□□■■□□■■□□□"
echo "□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□"
echo " 사슬 노드 자동설치 프로그램 버전 3.0.0 우분투             "
echo "                                                 "
echo " 시작전 이 프로그램을 네이버 소득자유 카페에서 다운받았는지 확인하십시오! "
echo " 주소: https://cafe.naver.com/childishlazyman/75  "
echo " 상세 상용방법 및 질문사항은 카페 및 소득자유 단톡방에 문의    "
echo "                                                 "
echo "                                                 "
echo "                                                 "
echo " 초롱초롱에게 커피한잔 : a7d8e46c6d956fff9dc534dfbf4904020d5484109532 (사슬) "
echo "                                                 "
echo "우분투 리눅스용 멀티노드 설치용"
echo "                                                 "
PS3='메뉴를 선택해주세요. : '
foods=("도커설치" "사슬노드_이미지_다운로드" "1번노드_설치" "1번노드_싱크" "2번노드_설치" "3번노드_설치" "4번노드_설치" "5번노드_설치" "6번노드_설치" "7번노드_설치" "8번노드_설치" "9번노드_설치" "10번노드_설치" "종료")

select fav in "${foods[@]}"; do
    case $fav in
        "도커설치")
            echo "도커 설치를 진행 합니다."
			
	    	A=`sudo apt-get update`
	    	echo "$A"
	    	B=`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - `
	    	echo "$B"
	    	C=`sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" `
	    	echo "$C"
	    	D=`sudo apt-get update `
	    	echo "$D"
	    	E=`sudo apt-get install docker-ce docker-ce-cli containerd.io`
	    	echo "$E"
	    	F=`sudo systemctl status docker`
	    	echo "$F"
            ;;
        "사슬노드_이미지_다운로드")
            echo "사슬노드 이미지를 다운로드 받습니다."
			
	    	A=`sudo docker pull artifriends/saseul-network:latest`
	    	echo "$A"
            ;;
        "1번노드_설치")
            echo "$PortAddress1 포트 노드를 설치합니다."
            A=`sudo mkdir /var/saseul-data$PortAddress1`
            echo "$A"
	    B=`sudo docker run -d --init --name saseul-node$PortAddress1 -p $PortAddress1:80 -v /var/saseul-data$PortAddress1:/var/saseul/saseul-network/data artifriends/saseul-network:latest`
	    echo "$B"
	    C=`sudo docker exec -i saseul-node$PortAddress1 saseul-script setenv --endpoint $IpAddress:$PortAddress1`
	    echo "$C"
            D=`sudo docker exec -i saseul-node saseul-script getenv -m $WalletAddress1`
	    echo "$D"
            ;;
        "1번노드_싱크")
            echo "$PortAddress1 포트 노드의 싱크중 입니다."
	    A=`sudo docker exec -i saseul-node$PortAddress1 saseul-script forcesync --peer $PeerNodeAddress`
	    echo "$A"
            ;;
        "2번노드_설치")
            echo "$PortAddress2 포트 노드를 설힙니다."
            A=`sudo mkdir /var/saseul-data$PortAddress2`
            echo "$A"
	    B=`sudo docker run -d --init --name saseul-node$PortAddress2 -p $PortAddress2:80 -v /var/saseul-data$PortAddress2:/var/saseul/saseul-network/data artifriends/saseul-network:latest`
	    echo "$B"
	    C=`sudo cp -p -R /var/saseul-data$PortAddress1/* /var/saseul-data$PortAddress2`
	    echo "$C"
	    D=`sudo docker exec -i saseul-node$PortAddress2 saseul-script setenv --endpoint $IpAddress:$PortAddress2`
	    echo "$D"
            E=`sudo docker exec -i saseul-node$PortAddress2 saseul-script getenv -m $WalletAddress2`
	    echo "$E"
            ;;
        "3번노드_설치")
            echo "$PortAddress3 포트 노드를 설치합니다."
            A=`sudo mkdir /var/saseul-data$PortAddress3`
            echo "$A"
	    B=`sudo docker run -d --init --name saseul-node$PortAddress3 -p $PortAddress3:80 -v /var/saseul-data$PortAddress3:/var/saseul/saseul-network/data artifriends/saseul-network:latest`
	    echo "$B"
	    C=`sudo cp -p -R /var/saseul-data$PortAddress1/* /var/saseul-data$PortAddress3`
	    echo "$C"
	    D=`sudo docker exec -i saseul-node$PortAddress3 saseul-script setenv --endpoint $IpAddress:$PortAddress3`
	    echo "$D"
            E=`sudo docker exec -i saseul-node$PortAddress3 saseul-script getenv -m $WalletAddress3`
	    echo "$E"
            ;;
        "4번노드_설치")
            echo "$PortAddress4 포트 노드를 설치합니다."
            A=`sudo mkdir /var/saseul-data$PortAddress4`
            echo "$A"
	    B=`sudo docker run -d --init --name saseul-node$PortAddress4 -p $PortAddress4:80 -v /var/saseul-data$PortAddress4:/var/saseul/saseul-network/data artifriends/saseul-network:latest`
	    echo "$B"
	    C=`sudo cp -p -R /var/saseul-data$PortAddress1/* /var/saseul-data$PortAddress4`
	    echo "$C"
	    D=`sudo docker exec -i saseul-node$PortAddress4 saseul-script setenv --endpoint $IpAddress:$PortAddress4`
	    echo "$D"
     	    E=`sudo docker exec -i saseul-node$PortAddress4 saseul-script getenv -m $WalletAddress4`
	    echo "$E"
            ;;
        "5번노드_설치")
            echo "$PortAddress5 포트 노드를 설치합니다."
            A=`sudo mkdir /var/saseul-data$PortAddress5`
            echo "$A"
	    B=`sudo docker run -d --init --name saseul-node$PortAddress5 -p $PortAddress5:80 -v /var/saseul-data$PortAddress5:/var/saseul/saseul-network/data artifriends/saseul-network:latest`
	    echo "$B"
	    C=`sudo cp -p -R /var/saseul-data$PortAddress1/* /var/saseul-data$PortAddress5`
	    echo "$C"
	    D=`sudo docker exec -i saseul-node$PortAddress5 saseul-script setenv --endpoint $IpAddress:$PortAddress5`
	    echo "$D"
            E=`sudo docker exec -i saseul-node$PortAddress5 saseul-script getenv -m $WalletAddress5`
	    echo "$E"
            ;;
        "6번노드_설치")
            echo "$PortAddress6 포트 노드를 설치합니다."
            A=`sudo mkdir /var/saseul-data$PortAddress6`
            echo "$A"
	    B=`sudo docker run -d --init --name saseul-node$PortAddress6 -p $PortAddress6:80 -v /var/saseul-data$PortAddress6:/var/saseul/saseul-network/data artifriends/saseul-network:latest`
	    echo "$B"
	    C=`sudo cp -p -R /var/saseul-data$PortAddress1/* /var/saseul-data$PortAddress6`
	    echo "$C"
	    D=`sudo docker exec -i saseul-node$PortAddress6 saseul-script setenv --endpoint $IpAddress:$PortAddress6`
	    echo "$D"
            E=`sudo docker exec -i saseul-node$PortAddress6 saseul-script getenv -m $WalletAddress6`
	    echo "$E"
            ;;
        "7번노드_설치")
            echo "$PortAddress7 포트 노드를 설치합니다."
            A=`sudo mkdir /var/saseul-data$PortAddress7`
            echo "$A"
	    B=`sudo docker run -d --init --name saseul-node$PortAddress7 -p $PortAddress7:80 -v /var/saseul-data$PortAddress7:/var/saseul/saseul-network/data artifriends/saseul-network:latest`
	    echo "$B"
	    C=`sudo cp -p -R /var/saseul-data$PortAddress1/* /var/saseul-data$PortAddress7`
	    echo "$C"
	    D=`sudo docker exec -i saseul-node$PortAddress7 saseul-script setenv --endpoint $IpAddress:$PortAddress7`
	    echo "$D"
            E=`sudo docker exec -i saseul-node$PortAddress7 saseul-script getenv -m $WalletAddress7`
	    echo "$E"
            ;;
        "8번노드_설치")
            echo "$PortAddress8 포트 노드를 설치합니다."
            A=`sudo mkdir /var/saseul-data$PortAddress8`
            echo "$A"
	    B=`sudo docker run -d --init --name saseul-node$PortAddress8 -p $PortAddress8:80 -v /var/saseul-data$PortAddress8:/var/saseul/saseul-network/data artifriends/saseul-network:latest`
	    echo "$B"
	    C=`sudo cp -p -R /var/saseul-data$PortAddress1/* /var/saseul-data$PortAddress8`
	    echo "$C"
	    D=`sudo docker exec -i saseul-node$PortAddress8 saseul-script setenv --endpoint $IpAddress:$PortAddress8`
	    echo "$D"
            E=`sudo docker exec -i saseul-node$PortAddress8 saseul-script getenv -m $WalletAddress8`
	    echo "$E"
            ;;
        "9번노드_설치")
            echo "$PortAddress9 포트 노드를 설치합니다."
            A=`sudo mkdir /var/saseul-data$PortAddress9`
            echo "$A"
	    B=`sudo docker run -d --init --name saseul-node$PortAddress9 -p $PortAddress9:80 -v /var/saseul-data$PortAddress9:/var/saseul/saseul-network/data artifriends/saseul-network:latest`
	    echo "$B"
	    C=`sudo cp -p -R /var/saseul-data$PortAddress1/* /var/saseul-data$PortAddress9`
	    echo "$C"
	    D=`sudo docker exec -i saseul-node$PortAddress9 saseul-script setenv --endpoint $IpAddress:$PortAddress9`
	    echo "$D"
            E=`sudo docker exec -i saseul-node$PortAddress9 saseul-script getenv -m $WalletAddress9`
	    echo "$E"
            ;;
        "10번노드_설치")
            echo "$PortAddress10 포트 노드를 설치합니다."
            A=`sudo mkdir /var/saseul-data$PortAddress10`
            echo "$A"
	    B=`sudo docker run -d --init --name saseul-node$PortAddress10 -p $PortAddress10:80 -v /var/saseul-data$PortAddress10:/var/saseul/saseul-network/data artifriends/saseul-network:latest`
	    echo "$B"
	    C=`sudo cp -p -R /var/saseul-data$PortAddress1/* /var/saseul-data$PortAddress10`
	    echo "$C"
	    D=`sudo docker exec -i saseul-node$PortAddress10 saseul-script setenv --endpoint $IpAddress:$PortAddress10`
	    echo "$D"
            E=`sudo docker exec -i saseul-node$PortAddress10 saseul-script getenv -m $WalletAddress10`
	    echo "$E"
            ;;
	"종료")
	    echo "작업을 종료했습니다."
	    exit
	    ;;
        *) echo " $REPLY 는 없는 메뉴 입니다.";;
    esac
done
