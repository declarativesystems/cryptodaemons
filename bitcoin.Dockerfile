FROM ubuntu:focal-20210119

ARG BITCOIN_VERSION
ARG BITCOIN_HASH
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl bzip2

RUN mkdir /root/.bitcoin

RUN cd /root \
    && curl "https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz" -O \
    && echo "${BITCOIN_HASH} bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum --check \
    && tar -zxvf "bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz" \
    && rm "bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz"  \
    && ln -s "./bitcoin-${BITCOIN_VERSION}" bitcoin

WORKDIR /root/bitcoin

# blockchain location
VOLUME /home/bitcoin/.bitcoin

# mainnnet
EXPOSE 8333
EXPOSE 8332

# testnet
EXPOSE 18333
EXPOSE 18333


ENTRYPOINT /home/bitcoin/bitcoin/bin/bitcoind
