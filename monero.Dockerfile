FROM ubuntu:focal-20210119

ARG MONERO_VERSION
ARG MONERO_HASH
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl bzip2
RUN useradd --create-home monero --uid 1000

USER monero

WORKDIR /home/monero
RUN mkdir /home/monero/.bitmonero

RUN curl "https://downloads.getmonero.org/cli/monero-linux-x64-v${MONERO_VERSION}.tar.bz2" -O \
    && echo "${MONERO_HASH} monero-linux-x64-v${MONERO_VERSION}.tar.bz2" | sha256sum --check \
    && tar -xjvf "monero-linux-x64-v${MONERO_VERSION}.tar.bz2" \
    && rm "monero-linux-x64-v${MONERO_VERSION}.tar.bz2"  \
    && ln -s "./monero-x86_64-linux-gnu-v${MONERO_VERSION}" monero

# blockchain location
VOLUME /home/monero/.bitmonero

# mainnet
EXPOSE 18080
EXPOSE 18081

# testnet
EXPOSE 28080
EXPOSE 28081

# stagenet
EXPOSE 38080
EXPOSE 38081

ENTRYPOINT /home/monero/monero/monerod
