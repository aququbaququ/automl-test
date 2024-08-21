#!/usr/bin/env bash

service ssh start 
echo $USER
exec bash && \
cd ./$SGHDIR && git pull && \
cd ./data && git switch main && git pull --rebase --autostash && cd ..  && \
pm2 delete all && cd ./data && git reset --hard HEAD && cd ..  && \
pm2 start ${app}  && \
# echo test | tee -a ./data/test-${app}.md  && \
export HANDYSSHUSER="root" && echo "$HANDYSSHUSER" > ./HANDYSSHUSER  && \
handy-sshd -p "$HSPORT" -u "$(cat ./HANDYSSHUSER)":"$HSPASS" & \
export boreport=$(shuf -i 2000-65000 -n 1) && echo "$boreport" > ./boreport && \
#nohup bore local -t bore.pub -p "$(cat ./boreport)" 22 >bore.log 2>&1 & \
cmdpid=$! && \
sleep 3 && \
#while ! ps -p $cmdpid > /dev/null
#do
#    export boreport=$(shuf -i 2000-65000 -n 1)
#    echo "$boreport" > ./boreport
#    nohup bore local -t bore.pub -p "$(cat ./boreport)" 22 &
#    cmdpid=$!
#    sleep 3
#done
MSG="wf: ${WORKFLOW} - ${APP}; boressh:  \`boldssh $(cat ./HANDYSSHUSER)@bore.pub -p $(cat ./boreport)\`" && \
tmpvar=$(curl -sX POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" -d "disable_web_page_preview=True" -d "parse_mode=Markdown" -d "chat_id=${TELEGRAM_CHAT_ID}" -d "text=${MSG}");
#sleep 1h
echo "Inside-Docker"
nohup bore local -t bore.pub -p "$(cat ./boreport)" 22 & 
