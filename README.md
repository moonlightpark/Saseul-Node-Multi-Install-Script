# Node-Install
사슬 노드 자동설치 프로그램 버전 3.0.0 우분투

윈도우용 원본 : https://cafe.naver.com/childishlazyman/75

윈도우용 파일 참고해서 작성함.


## Getting Started

First, run the shell script :

```bash
# Set basic variables set.
vi install.sh
:wq
# Permission settings
chmod 777 install.sh
# run
./install.sh
```

설치이후에는 saseul.sh 로 관리

```bash

chmod 777 saseul.sh
./saseul.sh

```


모든 노드 로그 감시

```bash

chmod 777 saseulLog.sh
while true; do ./saseulLog.sh ; sleep 1; done

```




Saseul Developer OpenTalk : https://open.kakao.com/o/gclfhqHf

Coffee Donation (SASEUL) : a7d8e46c6d956fff9dc534dfbf4904020d5484109532
