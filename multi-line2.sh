#!/usr/bin/env bash

# echo "HSPORT=$HSPORT" >> $GITHUB_ENV

apt update && apt-get install -y openssh-server sudo -y && service ssh start
apt-get update -y && apt-get install -y fish magic-wormhole jq neovim
mkdir -p ~/.config/fish && mkdir -p ~/.local/bin && echo "if [ -f ~/.bashrc ]; then . ~/.bashrc fi" | tee -a ~/.bash_profile && echo "export PATH=$HOME/.local/bin:$PATH" >> ~/.bashrc && source ~/.bashrc

(apt-get install -y git curl wget gpg && git config --global user.name "name" && git config --global user.email "email")
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg;
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null;
apt-get update && apt-get install -y gh;
# wget https://github.com/cli/cli/releases/download/v2.52.0/gh_2.52.0_linux_amd64.deb && apt-get install -y ./gh_2.52.0_linux_amd64.deb && rm ./gh_2.52.0_linux_amd64.deb

wget https://github.com/extrawurst/gitui/releases/download/v0.26.3/gitui-linux-x86_64.tar.gz && tar xvf gitui-linux-x86_64.tar.gz && mv ./gitui /usr/bin/. && \
wget https://github.com/jesseduffield/lazygit/releases/download/v0.42.0/lazygit_0.42.0_Linux_x86_64.tar.gz && tar -zxvf lazygit_0.42.0_Linux_x86_64.tar.gz && \
mv lazygit /usr/bin/.

gh auth setup-git && \
gh repo clone $SGHREPO && cd /$SGHDIR

apt-get install -y ca-certificates fonts-liberation libappindicator3-1 libasound2t64 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libnss3-dev libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils
# apt-get install -y libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0
# apt-get install -y libnss3 libnspr4 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 libxkbcommon0 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 libgbm1 libasound2
tmpvar=$(git submodule update --init --recursive && git config submodule.recurse true && git pull) && \
cp -r ./fixes/ghrunner-dotfiles/. ~/. && \
cp -r ./fixes/termux-configs/lazyvim ~/.config/. && \
#systemctl restart sshd && \
fish -c "lvim" &

# curl https://mise.run | sh
# echo '~/.local/bin/mise activate fish | source' >> ~/.config/fish/config.fish
# echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc && source ~/.bashrc

wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-archive-keyring.gpg 1>/dev/null
echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=amd64] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
apt-get update -y && apt-get install -y mise && \
echo 'eval "$(/usr/bin/mise activate bash)"' >>~/.bashrc && . ~/.bashrc && \
echo '/usr/bin/mise activate fish | source' >>~/.config/fish/config.fish && \
mise use --global node@14.15.4 && \
#mise activate --shims bash && mise reshim && . ~/.bashrc && \
mise x -- bash -c "cd /$SGHDIR && npm i -g yarn && npm i -g pm2 && npm i -g nodemon && yarn config set network-timeout 600000 -g && yarn --ignore-optional --ignore-scripts && node ./node_modules/puppeteer/install.js"
