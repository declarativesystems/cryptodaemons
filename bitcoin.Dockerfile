FROM ubuntu:jammy-20220531

ARG BITCOIN_VERSION
ARG BITCOIN_HASH

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /root/.bitcoin /app \
    && cd /app \
    && curl "https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz" -O \
    && echo "${BITCOIN_HASH}  bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -zxvf "bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz" \
    && rm "bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz"  \
    && ln -s "./bitcoin-${BITCOIN_VERSION}" bitcoin

WORKDIR /app/bitcoin

# blockchain location
VOLUME /root/.bitcoin

# mainnnet
EXPOSE 8333
EXPOSE 8332

# testnet
EXPOSE 18333
EXPOSE 18333


ENTRYPOINT ["/app/bitcoin/bin/bitcoind"]
