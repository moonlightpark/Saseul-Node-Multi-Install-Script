#!/bin/bash

clear

#:: 채굴된 사슬코인을 받을 노드별 지갑주소 입력 ::
WalletAddress='a7d8e46c6d956fff9dc534dfbf4904020d5484109532'

#:: 공인 IP 입력 ::
IpAddress='1.1.1.1'

#:: 블록데이터를 받아올 타겟노드 입력 ::
PeerNodeAddress='main.saseul.net'

echo " "
PS3='메뉴를 선택해주세요. : '
foods=("1.도커설치" "2.노드_다운로드" "3.노드_설치" "4.노드_설정" "5.종료")

number=1
SP=79 #90포트부터 시작

select fav in "${foods[@]}"; do
    case $fav in
        "1.도커설치")
	        echo "***********************************************************************************************"
            echo "패키지 업데이트 ..."
	    	echo "sudo apt-get update     <- 1) 복사해서 실행"
	    	echo " "
	    	echo "curl 설치 ..."
	    	echo "sudo apt install curl    <- 2) 복사해서 실행"
	    	echo " "
	    	echo "gpg 키등록 ..."
	    	echo "sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -       <- 3) 복사해서 실행"
	    	echo " "
			echo "repository 추가 ..."
			echo " "
	    	echo 'sudo sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"    <- 4) 복사해서 실행'
	    	echo " "
	    	echo "업데이트 ... "
	    	echo "sudo apt-get update  <- 5) 복사해서 실행"
	    	echo " "
	    	echo "도커 설치 ..."
	    	echo "sudo apt-get install docker-ce docker-ce-cli containerd.io     <- 6)복사해서 실행"
			echo " "
			echo "도커 설치 확인..."
			echo "sudo systemctl status docker <- 7)복사해서 실행"
			echo " "
			echo "./install.sh  <- 8)복사해서 실행"
			echo "***********************************************************************************************"
			exit
            ;;
        "2.노드_다운로드")
	        echo " "
            echo "사슬노드 도커 이미지를 다운로드중 ...(잠시만 기다려주세요.)"
	    	sudo docker pull artifriends/saseul-network:latest
	    	sleep 1
	    	sudo docker images
	    	echo " "
			echo "*******************************************************************"
			echo "${foods[@]}"
			echo "*******************************************************************"
            ;;
        "3.노드_설치")
	        echo " "
            number=1
            echo "멀티 노드 갯수를 입력하세요. : "
            read END
			while [ $number -le $END ]
			do
            	plus=`expr $SP + $number`
				echo "$number: ""$plus 포트"
				A=$(sudo mkdir /var/saseul-data$plus)
				echo "[###                   ]"
				echo "$(sudo docker run -d --init --name saseul-node$plus -p $plus:80 -v /var/saseul-data$plus:/var/saseul/saseul-network/data artifriends/saseul-network:latest)"
				echo "[########              ]"
                
				sudo docker exec -i saseul-node$plus saseul-install
				sleep 1
                echo " "
                echo " ****"
                echo " y/n 입력하는 곳에서 y 를 모두 4번 입력하고 넘어가세요."
                echo " 9번 메뉴에서 지갑주소 설정을 일괄 진행합니다."
                echo " "
                echo " ***"
                sudo docker exec -i saseul-node$plus saseul-script setenv
				echo "[######################]"
				
				((number++))
			done
			
			echo " "
			echo "*******************************************************************"
			echo "${foods[@]}"
			echo "*******************************************************************"
            ;;
        "4.노드_설정")
        	echo " "
            number=1
        	echo "설치된 노드 갯수를 입력하세요. : "
        	read END
			while [ $number -le $END ]
			do
            	plus=`expr $SP + $number`
				sudo docker exec -i saseul-node$plus saseul-install
                sudo docker exec -i saseul-node$plus saseul-script setenv --endpoint $IpAddress:$plus
				sudo docker exec -i saseul-node$plus saseul-script setenv -m $WalletAddress
				
				((number++))
			done
			echo " "
			echo "*******************************************************************"
			echo "${foods[@]}"
			echo "*******************************************************************"
            ;;
		"5.종료")
		    echo "작업을 종료했습니다."
	    	exit
		    ;;
	        *) echo " $REPLY 는 없는 메뉴 입니다.";;
    esac
done


