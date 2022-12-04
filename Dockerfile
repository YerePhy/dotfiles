FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/home
COPY ./* $HOME/dotfiles/
RUN chmod +x $HOME/dotfiles/setup.sh \
    && $HOME/dotfiles/setup.sh 

