FROM krishna1m/scala:latest-ubuntu
RUN apt-get update \
    && apt-get install -y curl wget gzip git tmux jq ripgrep fd-find neovim
WORKDIR /root
RUN git clone https://github.com/krishna1m/dot-config.git
RUN mv dot-config/* ~/. && mv dot-config/.[^.]* ~/. && rmdir dot-config && rm -rf ~/.git
RUN mkdir .config && mv vim .config/. && mv nvim .config/.
WORKDIR /
