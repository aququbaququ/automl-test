#!/usr/bin/env bash

echo $USER
# exec bash && \
echo "root:$HSPASS" | chpasswd root
service ssh start
cd /$SGHDIR && git pull
ls ./ | grep ${APP} | echo
cd ./data && git switch main && git pull --rebase --autostash && cd ..;
mise x -- pm2 start "${APP}"
# mise x -- bash -c "cd /$SGHDIR && pm2 start ${APP}"
# echo test | tee -a ./data/test-${APP}.md  && \
export HANDYSSHUSER="root" && echo "$HANDYSSHUSER" > ./HANDYSSHUSER
# handy-sshd -p "$HSPORT" -u "$(cat ./HANDYSSHUSER)":"$HSPASS" & \
# handy-sshd -p 22 -u "$(cat ./HANDYSSHUSER)":"$HSPASS" & \
# export boreport=$(shuf -i 2000-65000 -n 1)
mise x -- npm i shuf -g
export boreport=$(mise x -- shuf -i 2000-65000 -n 1)
echo "$boreport" > ./boreport
# nohup bore local -t bore.pub -p "$(cat ./boreport)" 22 >bore.log 2>&1 & \
MSG="wf: ${WORKFLOW} - ${APP}; boressh:  \`boldssh $(cat ./HANDYSSHUSER)@bore.pub -p $(cat ./boreport)\`"
curl -sX POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" -d "disable_web_page_preview=True" -d "parse_mode=Markdown" -d "chat_id=${TELEGRAM_CHAT_ID}" -d "text=${MSG}"
echo "before-bore"
nohup bore local -t bore.pub -p "$(cat ./boreport)" 22 &
# cmdpid=$! && \
# sleep 3 && \
# while ! ps -p $cmdpid > /dev/null
# do
#    export boreport=$(shuf -i 2000-65000 -n 1)
#    echo "$boreport" > ./boreport
#    nohup bore local -t bore.pub -p "$(cat ./boreport)" 22 &
#    cmdpid=$!
#    sleep 3
# done
# exec bash && \
# MSG="wf: ${WORKFLOW} - ${APP}; boressh:  \`boldssh $(cat ./HANDYSSHUSER)@bore.pub -p $(cat ./boreport)\`" && \
# tmpvar=$(curl -sX POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" -d "disable_web_page_preview=True" -d "parse_mode=Markdown" -d "chat_id=${TELEGRAM_CHAT_ID}" -d "text=${MSG}");
# sleep 1h

# curl -sX POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" -d "disable_web_page_preview=True" -d "parse_mode=Markdown" -d "chat_id=${TELEGRAM_CHAT_ID}" -d "text=${MSG}" && \
# nohup bore local -t bore.pub -p "$(cat ./boreport)" 22 &
echo "Inside-Docker"