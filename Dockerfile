FROM ubuntu:latest

# COPY entrypoint.sh /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]

# COPY multi-line.sh .
# COPY network-tools.sh .
# RUN chmod +x ./multi-line.sh && ./multi-line.sh
# RUN chmod +x ./network-tools.sh && ./network-tools.sh

# RUN apt-get update && apt-get install -y fish
# RUN useradd -ms /usr/bin/fish runner
# WORKDIR /home/runner
# USER runner

RUN --mount=type=secret,id=GH_TOKEN \
    --mount=type=secret,id=SGHREPO \
    --mount=type=secret,id=SGHDIR \
    GH_TOKEN="$(cat /run/secrets/GH_TOKEN)" && export GH_TOKEN && \
    SGHREPO="$(cat /run/secrets/SGHREPO)" && export SGHREPO && \
    SGHDIR="$(cat /run/secrets/SGHDIR)" && export SGHDIR && \
    echo finish
COPY multi-line2.sh .
RUN chmod +x ./multi-line2.sh && ./multi-line2.sh

# RUN (apt-get update && \
# apt-get install -y fish magic-wormhole jq fuse libfuse2 && \
# mkdir -p ~/.config/fish && \
# mkdir -p ~/.local/bin && \
# echo "if [ -f ~/.bashrc ]; then . ~/.bashrc fi" | tee -a ~/.bash_profile)

# RUN (apt-get install -y git curl wget gpg && git config --global user.name "name" && git config --global user.email "email")
# RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg;
# RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null;
# RUN apt-get update && apt-get install -y gh;
# # RUN wget https://github.com/cli/cli/releases/download/v2.52.0/gh_2.52.0_linux_amd64.deb && apt-get install -y ./gh_2.52.0_linux_amd64.deb && rm ./gh_2.52.0_linux_amd64.deb

# RUN wget https://github.com/neovim/neovim-releases/releases/download/v0.10.0/nvim.appimage && \
# chmod u+x ./nvim.appimage && mv ./nvim.appimage ~/.local/bin/nvim && \
# wget https://github.com/extrawurst/gitui/releases/download/v0.26.3/gitui-linux-x86_64.tar.gz && tar xvf gitui-linux-x86_64.tar.gz && mv ./gitui ~/.local/bin/. && \
# wget https://github.com/jesseduffield/lazygit/releases/download/v0.42.0/lazygit_0.42.0_Linux_x86_64.tar.gz && tar -zxvf lazygit_0.42.0_Linux_x86_64.tar.gz && \
# mv lazygit ~/.local/bin/.

# # RUN (set -u && echo "$GH_TOKEN" > .githubtoken && unset GITHUB_TOKEN && gh auth login --with-token < .githubtoken && rm .githubtoken)
# RUN --mount=type=secret,id=GH_TOKEN \
#     --mount=type=secret,id=SGHREPO \
#     --mount=type=secret,id=SGHDIR \
#     GH_TOKEN="$(cat /run/secrets/GH_TOKEN)" && export GH_TOKEN && \
#     SGHREPO="$(cat /run/secrets/SGHREPO)" && export SGHREPO && \
#     SGHDIR="$(cat /run/secrets/SGHDIR)" && export SGHDIR && \
#     gh auth setup-git && \
#     gh repo clone $SGHREPO && cd "$SGHDIR" && \
#     apt-get install -y ca-certificates fonts-liberation libappindicator3-1 libasound2t64 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils && \
#     tmpvar=$(git submodule update --init --recursive && git config submodule.recurse true && git pull) && \
#     cp -r ./fixes/ghrunner-dotfiles/. ~/. && \
#     cp -r ./fixes/termux-configs/lazyvim ~/.config/. && \
#     systemctl restart sshd && \
#     fish -c "lvim" &

# RUN exec bash && curl https://mise.run | sh && \
#     echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc && . ~/.bashrc && \
#     mise use --global node@14.15.4 && \
#     mise activate --shims && mise reshim && . ~/.bashrc && \
#     npm i -g yarn && npm i -g pm2 && npm i -g nodemon && yarn config set network-timeout 600000 -g && yarn --ignore-optional --ignore-scripts && node ./node_modules/puppeteer/install.js

ENTRYPOINT ["/bin/bash"]