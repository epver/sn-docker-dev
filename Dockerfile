# author hoor
FROM dokken/centos-stream-8

# layer
RUN yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make libffi-devel xz-devel mysql-devel python3-devel \
    && curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash \
    && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc \
    && echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc \
    && echo 'eval "$(pyenv init -)"' >> ~/.bashrc \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash \
    && source ~/.bashrc \
    && pyenv install 3.11.2 \
    && pyenv global 3.11.2 \
    && nvm install 18.14.2 \
    && mkdir -p /coding

WORKDIR /coding

CMD ["/bin/bash"]
