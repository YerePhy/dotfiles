FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ADD ./setup.sh /home/setup.sh
RUN chmod +x /home/setup.sh \
    && /home/setup.sh

