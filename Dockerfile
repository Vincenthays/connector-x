FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
ENV PYTHON_CONFIGURE_OPTS "--enable-shared"

RUN apt update && apt install -y clang patchelf make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev git vim libcurl4-openssl-dev zlib1g-dev libkrb5-dev

RUN curl https://pyenv.run | bash
ENV PATH "/root/.pyenv/bin:${PATH}"
RUN eval "$(pyenv init --path)"
RUN pyenv install 3.11 3.12
RUN pyenv global 3.11 3.12
RUN pyenv exec pip install maturin

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain none
ENV PATH "/root/.cargo/bin:${PATH}"

#RUN pyenv exec maturin publish --repository bigtable2 --no-sdist -i python3.11 python3.12
