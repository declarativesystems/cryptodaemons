FROM ubuntu:focal-20210119

ARG CHIA_VERSION
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    curl \
    bzip2 \
    build-essential \
    git \
    lsb-release \
    sudo

RUN mkdir /root/.chia

RUN cd \
    && git clone "https://github.com/Chia-Network/chia-blockchain" \
    && cd chia-blockchain \
    && git checkout ${CHIA_VERSION} \
    && chmod +x install.sh \
    && ./install.sh

# Activate the VENV by default
# https://pythonspeed.com/articles/activate-virtualenv-dockerfile/
ENV VIRTUAL_ENV=/root/chia-blockchain/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

EXPOSE 8444

ENTRYPOINT ["chia"]