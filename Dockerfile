FROM ubuntu:latest

# COPY entrypoint.sh /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]

COPY multi-line.sh /multi-line.sh
COPY network-tools.sh /network-tools.sh
RUN multi-line.sh
RUN network-tools.sh
ENTRYPOINT ["/bin/bash"]