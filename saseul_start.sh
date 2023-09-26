#!/bin/bash

clear


END=85

PeerNodeAddress='main.saseul.net'


PS3='메뉴를 선택해주세요. : '
foods=("1.Start" "2.StartMining" "3.FroceSync" "4.Exit")

select fav in "${foods[@]}"; do
    case $fav in
        "1.Start")
            echo "Starting Saseul...."
			
			number=80
			while [ $number -le $END ]
			do
				A=$(docker exec -i saseul-node$number saseul-script start)
				echo "$number: "$A
				sleep 1
				((number++))
			done
			echo " "
			echo "${foods[@]}"
            ;;
        "2.StartMining")
            echo "Starting mining ..."
			
			number=80
			while [ $number -le $END ]
			do
				A=$(docker exec -i saseul-node$number saseul-script startmining)
				echo "$number: "$A
				sleep 1
				((number++))
			done
			echo " "
			echo "${foods[@]}"
            ;;
        "3.FroceSync")
            echo "FroceSync ..."
			
			number=80
			while [ $number -le $END ]
			do
				A=$(docker exec -i saseul-node$number saseul-script forcesync -p $PeerNodeAddress)
				echo "$number: "$A
				sleep 5
				((number++))
			done
			echo " "
			echo "${foods[@]}"
            ;;
	"4.Exit")
	    echo "작업을 종료했습니다."
	    exit
	    ;;
        *) echo " $REPLY 는 없는 메뉴 입니다.";;
    esac
done
