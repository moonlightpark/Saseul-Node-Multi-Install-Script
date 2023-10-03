#!/bin/bash

clear
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::::::::::::::::::::::::::::::::: 기초정보 입력 ::::::::::::::::::::::::::::::::::::::

#:: 채굴된 사슬코인을 받을 노드별 지갑주소 입력 ::
WalletAddress='22a43847efd74831c837e8fdf299490dc5bff1edb847'

#:: 공인 IP 입력 ::
IpAddress='211.222.145.105'

#:: 블록데이터를 받아올 타겟노드 입력 ::
PeerNodeAddress='main.saseul.net'


echo "_SSSSS__ _________ ________ _________ _________ __SS__ ______SS___SS_ _________ ______SS_ _________ __"
echo "SS___SS_ __SSSSS__ ___SSSS_ ___SSSS__ _________ __SS__ ______SSS__SS_ _________ ______SS_ ___SSSS__ __"
echo "_SSS____ ______SS_ __SS____ __SS__SS_ __SS__SS_ __SS__ ______SSSS_SS_ ___SSSS__ ___SSSSS_ __SS__SS_ __"
echo "___SSS__ ___SSSSS_ ___SSS__ __SSSSSS_ __SS__SS_ __SS__ ______SS_SSSS_ __SS__SS_ __SS__SS_ __SSSSSS_ __"
echo "SS___SS_ __SS__SS_ _____SS_ __SS_____ __SS__SS_ __SS__ ______SS__SSS_ __SS__SS_ __SS__SS_ __SS_____ __"
echo "_SSSSS__ ___SSSSS_ __SSSS__ ___SSSSS_ ___SSS_S_ ___SS_ ______SS___SS_ ___SSSS__ ___SSSS__ ___SSSSS_ __"
echo "  "
echo "  "
echo " 사슬 노드 자동설치 프로그램 버전 3.0.0 우분투             "
echo "                                                 "
echo " 시작전 이 프로그램을 네이버 소득자유 카페에서 다운받았는지 확인하십시오! "
echo " 주소: https://cafe.naver.com/childishlazyman/75  "
echo " 상세 상용방법 및 질문사항은 카페 및 소득자유 단톡방에 문의    "
echo "                                                 "
echo "                                                 "
echo "                                                 "
echo " 초롱초롱에게 커피한잔 : a7d8e46c6d956fff9dc534dfbf4904020d5484109532 (SL)"
echo "                                                 "
echo " 우분투 리눅스용 멀티노드 설치용"
echo "                                                 "
echo " ↓↓↓                                             "
echo " sudo bash 명령을 실행 root 권한으로 실행 (필수)        "
echo "                                                 "
PS3='메뉴를 선택해주세요. : '
foods=("1.도커설치" "2.사슬노드_다운로드" "3.노드_설치" "4.노드_싱크" "5.노드_로그" "6.노드_GetEnv" "7.종료")

number=1
SP=79 #80포트부터 시작

select fav in "${foods[@]}"; do
    case $fav in
        "1.도커설치")
	        echo " "
            echo "패키지 업데이트 ..."
	    	A=$(apt-get update)
	    	echo "$A"
	    	echo "curl 설치 ..."
	    	AA=$(apt install curl)
	    	echo "$AA"
	    	echo "[####                  ]"
	    	echo "gpg 키등록 ..."
	    	B=$(curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - )
	    	echo "$B"
	    	#BB=$(apt-key add -)
	    	#echo "$BB"
	    	C=$(add-apt-repository \deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\ )
	    	echo "$C"
	    	echo "[######                ]"
	    	D=$(apt-get update)
	    	echo "$D"
	    	echo "[###############       ]"
	    	echo "도커 설치 ..."
	    	E=$(apt-get install docker-ce docker-ce-cli containerd.io)
	    	echo "$E"
	    	echo "[######################]"
			echo "*********************************************************"
			echo "${foods[@]}"
			echo "*********************************************************"
            ;;
        "2.사슬노드_다운로드")
	        echo " "
            echo "사슬노드 도커 이미지를 다운로드중 ...(잠시만 기다려주세요.)"
	    	A=$(docker pull artifriends/saseul-network:latest)
	    	echo "$A"
	    	sleep 1
	    	B=$(docker images)
	    	echo "$B"
	    	echo " "
			echo "*********************************************************"
			echo "${foods[@]}"
			echo "*********************************************************"
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
				A=$(mkdir /var/saseul-data$plus)
				echo "[###                   ]"
				B=$(docker run -d --init --name saseul-node$plus -p $plus:80 -v /var/saseul-data$plus:/var/saseul/saseul-network/data artifriends/saseul-network:latest)
			    echo "$B"
				sleep 3
				echo "[########              ]"
				#D=$(docker exec -i saseul-node$plus saseul-install)
				#echo "$D"
				echo "[###############       ]"
				echo "[ENTER]"
				C=$(docker exec -i saseul-node$plus saseul-script setenv --endpoint $IpAddress:$plus)
				echo "$C"

				E=$(docker exec -i saseul-node$plus saseul-script setenv -m $WalletAddress)
				echo "$E"				
				echo "[######################]"
				
				((number++))
			done
			
			echo " "
			echo "*********************************************************"
			echo "${foods[@]}"
			echo "*********************************************************"
            ;;
        "4.노드_싱크")
        	echo " "
            number=1
        	echo "설치된 노드 갯수를 입력하세요. : "
        	read END
			while [ $number -le $END ]
			do
            	plus=`expr $SP + $number`
				echo "$number: ""$plus 노드 싱크를 시작합니다."
				A=$(docker exec -i saseul-node$plus saseul-script forcesync -p $PeerNodeAddress)
				echo "$A"
        	
				((number++))
			done
        	
			echo " "
			echo "*********************************************************"
			echo "${foods[@]}"
			echo "*********************************************************"
            ;;
        "5.노드_로그")
        	echo " "
            number=1
        	echo "설치된 노드 갯수를 입력하세요. : "
        	read END
			while [ $number -le $END ]
			do
			
            	plus=`expr $SP + $number`
				A=$(docker exec -i saseul-node$plus saseul-script log )
				echo "$A"
				sleep 1	
				((number++))
			done
        	
			echo " "
			echo "*********************************************************"
			echo "${foods[@]}"
			echo "*********************************************************"
            ;;
        "6.노드_GetEnv")
        	echo " "
            number=1
        	echo "설치된 노드 갯수를 입력하세요. : "
        	read END
			while [ $number -le $END ]
			do
            	plus=`expr $SP + $number`
				A=$(docker exec -i saseul-node$plus saseul-script getenv -a )
				echo "$A"
				
				((number++))
			done
        	
			echo " "
			echo "*********************************************************"
			echo "${foods[@]}"
			echo "*********************************************************"
            ;;

		"7.종료")
		    echo "작업을 종료했습니다."
	    	exit
		    ;;
	        *) echo " $REPLY 는 없는 메뉴 입니다.";;
    esac
done



