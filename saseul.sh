#!/bin/bash

END=90

PeerNodeAddress='main.saseul.net'
PeerNodeAddress2='aroma.saseul.net'
PeerNodeAddress3='blanc.saseul.net'

PS3='메뉴를 선택해주세요. : '
foods=("1.Start" "2.StartMining" "3.FroceSync" "4.SingeFroceSync" "5.Log" "6.Exit")

select fav in "${foods[@]}"; do
    case $fav in
        "1.Start")
            echo "Starting Saseul...."

			number=80
			while [ $number -le $END ]
			do
				A=$(docker exec -i saseul-node$number saseul-script start)
				echo "**********"
				echo "$number: ""$A"
				echo "**********"
				((number++))
			done
			echo "*******************************************************************"
			echo "${foods[@]}"
			echo "*******************************************************************"
            ;;
        "2.StartMining")
            echo "Starting mining ..."

			number=80
			while [ $number -le $END ]
			do
				A=$(docker exec -i saseul-node$number saseul-script startmining)
				echo "**********"
				echo "$number: ""$A"
				echo "**********"
				((number++))
			done
			echo "*******************************************************************"
			echo "${foods[@]}"
			echo "*******************************************************************"
            ;;
        "3.FroceSync")
            echo "FroceSync ..."

		number=80
		while [ $number -le $END ]
		do
			RE=$(docker restart saseul-node$number)
			echo "$RE"
			sleep 3
			A=$(docker exec -i saseul-node$number saseul-script forcesync -p $PeerNodeAddress)
			echo "**********"
			echo "$number: ""$A"
			echo "**********"
			sleep 3
			B=$(docker exec -i saseul-node$number saseul-script start)
                	echo "$B"
                	sleep 6
                	STM=$(docker exec -i saseul-node$number saseul-script startmining)
        	        echo "$STM"
			((number++))
		done
		echo "*******************************************************************"
		echo "${foods[@]}"
		echo "*******************************************************************"
            ;;
        "4.SingeFroceSync")
            echo "싱크하실 노드번호를 입력하세요 : "
		read SINGLE
		A=$(docker exec -i saseul-node$SINGLE saseul-script forcesync -p $PeerNodeAddress)
		echo "$A"
  		A=$(docker exec -i saseul-node$SINGLE saseul-script forcesync -p $PeerNodeAddress2)
		echo "$A"
  		A=$(docker exec -i saseul-node$SINGLE saseul-script forcesync -p $PeerNodeAddress3)
		echo "$A"
		sleep 3
            B=$(docker exec -i saseul-node$SINGLE saseul-script start)
            echo "$B"
            sleep 6
            STM=$(docker exec -i saseul-node$SINGLE saseul-script startmining)
            echo "$STM"
		echo " "
		echo "*******************************************************************"
		echo "${foods[@]}"
		echo "*******************************************************************"
            ;;
        "5.Log")
            echo "Log ..."

			number=80
			while [ $number -le $END ]
			do
				A=$(docker exec -i saseul-node$number saseul-script log )
				echo "**********"
				echo "Node $number Port: ""$A"
				echo "**********"
				((number++))
			done
			echo "*******************************************************************"
			echo "${foods[@]}"
			echo "*******************************************************************"
            ;;
	"6.Exit")
	    echo "작업을 종료했습니다."
	    exit
	    ;;
        *) echo " $REPLY 는 없는 메뉴 입니다.";;
    esac
done
