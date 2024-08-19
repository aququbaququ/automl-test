FROM ubuntu:latest

# COPY entrypoint.sh /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]

RUN multi-line.sh
RUN network-tools.sh
ENTRYPOINT ["/bin/bash"]