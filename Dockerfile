FROM ubuntu

WORKDIR /app

ARG DEBIAN_FRONTEND="noninteractive"
ARG PYTHON_CONFIGURE_OPTS="--enable-shared"

RUN apt update && apt install -y clang patchelf make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev git vim libcurl4-openssl-dev zlib1g-dev libkrb5-dev protobuf-compiler libprotobuf-dev
RUN curl https://pyenv.run | sh
RUN curl https://sh.rustup.rs --proto '=https' --tlsv1.2 -sSf | sh -s -- -y --default-toolchain none
ENV PATH "/root/.pyenv/bin:/root/.pyenv/shims:/root/.cargo/bin:${PATH}"
RUN pyenv install 3.10 3.11 3.12
RUN pyenv global 3.10 3.11 3.12
RUN pyenv exec pip install maturin
