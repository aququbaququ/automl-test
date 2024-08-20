#!/usr/bin/env bash

apt-get -y update && apt-get install -y git curl wget gpg coreutils
mkdir -p ~/.local/bin && echo "export TERM=xterm-256color" >> ~/.bashrc && \
wget https://github.com/nwtgck/handy-sshd/releases/download/v0.4.3/handy-sshd-0.4.3-linux-amd64.deb && apt-get install -y ./handy-sshd-0.4.3-linux-amd64.deb && rm ./handy-sshd-0.4.3-linux-amd64.deb && \
export HANDYSSHUSER="root" && echo "$HANDYSSHUSER" > ./HANDYSSHUSER
# handy-sshd -p "$HSPORT" -u "$(cat ./HANDYSSHUSER)":"$HSPASS" & \
wget https://github.com/ekzhang/bore/releases/download/v0.5.1/bore-v0.5.1-x86_64-unknown-linux-musl.tar.gz && tar xf ./bore-v0.5.1-x86_64-unknown-linux-musl.tar.gz && mv ./bore /usr/bin/. && \
chmod +x /usr/bin/. && \
# export boreport=$(shuf -i 2000-65000 -n 1) && echo "$boreport" > ./boreport && \
# echo "H $HSPORT" && \
# echo "W ${WORKFLOW}" && \
# echo "B $(cat ./boreport)" && \
# nohup bore local -t bore.pub -p "$(cat ./boreport)" "$HSPORT" & \
# cmdpid=$! && \
# sleep 3 && \
# while ! ps -p $cmdpid > /dev/null
# do
#   export boreport=$(shuf -i 2000-65000 -n 1)
#   echo "$boreport" > ./boreport
#   nohup bore local -t bore.pub -p "$(cat ./boreport)" $HSPORT &
#   cmdpid=$!
#   sleep 3
# done
# echo "${WORKFLOW}" > ~/workflowname && \
# SSHXURL="" && \
# MSG="wf: ${WORKFLOW} - ${APP}; boressh:  \`boldssh $(cat ./HANDYSSHUSER)@bore.pub -p $(cat ./boreport)\`" && \
# tmpvar=$(curl -sX POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" -d "disable_web_page_preview=True" -d "parse_mode=Markdown" -d "chat_id=${TELEGRAM_CHAT_ID}" -d "text=${MSG}"); \
echo "root:$HSPASS" | chpasswd root && \
# sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
# echo 'PermitRootLogin yes' | tee -a /etc/ssh/sshd_config && \
# systemctl reload sshd
echo finish