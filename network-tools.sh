#!/bin/bash

echo "export TERM=xterm-256color" >> ~/.bashrc
wget https://github.com/nwtgck/handy-sshd/releases/download/v0.4.3/handy-sshd-0.4.3-linux-amd64.deb && sudo apt install ./handy-sshd-0.4.3-linux-amd64.deb && rm ./handy-sshd-0.4.3-linux-amd64.deb
sudo handy-sshd -p "$HSPORT" -u "$HSUSER":"$HSPASS" &
WEBPORT="$HSPORT"
wget https://github.com/ekzhang/bore/releases/download/v0.5.1/bore-v0.5.1-x86_64-unknown-linux-musl.tar.gz && tar xf ./bore-v0.5.1-x86_64-unknown-linux-musl.tar.gz && mv ./bore ~/.local/bin/.
chmod +x ~/.local/bin/.
boreport=$(shuf -i 2000-65000 -n 1)
nohup bore local -t bore.pub -p $boreport $HSPORT &
cmdpid=$!
sleep 3
while ! ps -p $cmdpid > /dev/null
do
  boreport=$(shuf -i 2000-65000 -n 1)
  nohup bore local -t bore.pub -p $boreport $HSPORT &
  cmdpid=$!
  sleep 3
done
echo "boreport=$boreport" >> $GITHUB_ENV

echo "${{ github.workflow }}" > ~/workflowname
SSHXURL=""
MSG=$'\n'"wf: ${{ github.workflow }} - ${{ github.event.inputs.app }}"$'\n'"boressh:  \`boldssh ${HSUSER}@bore.pub -p ${boreport}\`";
tmpvar=$(curl -sX POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" -d "disable_web_page_preview=True" -d "parse_mode=Markdown" -d "chat_id=${TELEGRAM_CHAT_ID}" -d "text=${MSG}");

echo $HSUSER:$HSPASS | sudo chpasswd root
echo $HSUSER:$HSPASS | sudo chpasswd runner
sudo sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo echo 'PermitRootLogin yes' | sudo tee -a /etc/ssh/sshd_config
sudo systemctl reload sshd
WEBPORT=22