FROM krishna1m/scala:latest-ubuntu
RUN apt-get update \
    && apt-get install -y curl wget git jq vim
RUN useradd -ms /bin/bash krishna1m
USER krishna1m
COPY .vimrc /home/krishna1m/
COPY .bashrc /home/krishna1m/
WORKDIR /home/krishna1m
