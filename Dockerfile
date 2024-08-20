FROM ubuntu:latest

# COPY entrypoint.sh /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]

# RUN apt-get update && apt-get install -y fish
# RUN useradd -ms /usr/bin/fish runner
# WORKDIR /home/runner
# USER runner

ARG GH_TOKEN
ARG SGHREPO
ARG SGHDIR
ARG SGHTOKEN
ARG SGHTOKENLOCAL
ARG SNUSER
ARG SNUSERTOKEN
ARG SNSKEY
ARG HSUSER
ARG HSPASS
ARG HSPORT
ARG NGROK_TOKEN
ARG SSH_PASSWORD
ARG TELEGRAM_BOT_TOKEN
ARG TELEGRAM_CHAT_ID
ARG ENV64
ARG WORKFLOW_REF
ARG WORKFLOW
ARG APP

# RUN --mount=type=secret,id=GH_TOKEN \
#     --mount=type=secret,id=SGHREPO \
#     --mount=type=secret,id=SGHDIR \
#     --mount=type=secret,id=SGHTOKEN \
#     --mount=type=secret,id=SGHTOKENLOCAL \
#     --mount=type=secret,id=SNUSER \
#     --mount=type=secret,id=SNUSERTOKEN \
#     --mount=type=secret,id=SNSKEY \
#     --mount=type=secret,id=HSUSER \
#     --mount=type=secret,id=HSPASS \
#     --mount=type=secret,id=HSPORT \
#     --mount=type=secret,id=NGROK_TOKEN \
#     --mount=type=secret,id=SSH_PASSWORD \
#     --mount=type=secret,id=TELEGRAM_BOT_TOKEN \
#     --mount=type=secret,id=TELEGRAM_CHAT_ID \
#     --mount=type=secret,id=ENV64 \
#     --mount=type=secret,id=WORKFLOW_REF \
#     --mount=type=secret,id=WORKFLOW \
#     --mount=type=secret,id=APP \
#     GH_TOKEN="$(cat /run/secrets/GH_TOKEN)" && export GH_TOKEN && \
#     SGHREPO="$(cat /run/secrets/SGHREPO)" && export SGHREPO && \
#     SGHDIR="$(cat /run/secrets/SGHDIR)" && export SGHDIR && \
#     SGHTOKEN="$(cat /run/secrets/SGHTOKEN)" && export SGHTOKEN && \
#     SGHTOKENLOCAL="$(cat /run/secrets/SGHTOKENLOCAL)" && export SGHTOKENLOCAL && \
#     SNUSER="$(cat /run/secrets/SNUSER)" && export SNUSER && \
#     SNUSERTOKEN="$(cat /run/secrets/SNUSERTOKEN)" && export SNUSERTOKEN && \
#     SNSKEY="$(cat /run/secrets/SNSKEY)" && export SNSKEY && \
#     HSUSER="$(cat /run/secrets/HSUSER)" && export HSUSER && \
#     HSPASS="$(cat /run/secrets/HSPASS)" && export HSPASS && \
#     HSPORT="$(cat /run/secrets/HSPORT)" && export HSPORT && \
#     NGROK_TOKEN="$(cat /run/secrets/NGROK_TOKEN)" && export NGROK_TOKEN && \
#     SSH_PASSWORD="$(cat /run/secrets/SSH_PASSWORD)" && export SSH_PASSWORD && \
#     TELEGRAM_BOT_TOKEN="$(cat /run/secrets/TELEGRAM_BOT_TOKEN)" && export TELEGRAM_BOT_TOKEN && \
#     TELEGRAM_CHAT_ID="$(cat /run/secrets/TELEGRAM_CHAT_ID)" && export TELEGRAM_CHAT_ID && \
#     ENV64="$(cat /run/secrets/ENV64)" && export ENV64 && \
#     WORKFLOW_REF="$(cat /run/secrets/WORKFLOW_REF)" && export WORKFLOW_REF && \
#     WORKFLOW="$(cat /run/secrets/WORKFLOW)" && export WORKFLOW && \
#     APP="$(cat /run/secrets/APP)" && export APP && \
#     echo finish

COPY multi-line2.sh .
RUN chmod +x ./multi-line2.sh && ./multi-line2.sh
COPY network-tools2.sh .
RUN chmod +x ./network-tools2.sh && ./network-tools2.sh

ENTRYPOINT ["/bin/bash"]
COPY run-app.sh /.
CMD chmod +x /run-ap.sh && nohup sh -c "/run-app.sh" &
# CMD sh -c "sh /run-app.sh"
# ENTRYPOINT ["/bin/bash", "/run-app.sh"]
EXPOSE 22
