FROM krishna1m/scala:latest
RUN apt-get update && apt update \
    && apt-get install -y curl wget gzip git tmux jq ripgrep fd-find \
    && apt install -y neovim
RUN shopt -s dotglob
WORKDIR /opt
RUN git clone https://github.com/krishna1m/dot-config.git
