FROM alpine:20220328

ARG BITCOIN_VERSION
ARG BITCOIN_HASH
RUN apk update && apk --no-cache add curl \
    && rm -rf /var/cache/apk/*  \
    && mkdir /root/.bitcoin  \
    && cd /root \
    && curl "https://bitcoincore.org/bin/bitcoin-core-23.0/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz" -O \
    && echo "${BITCOIN_HASH}  bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -zxvf "bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz" \
    && rm "bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz"  \
    && ln -s "./bitcoin-${BITCOIN_VERSION}" bitcoin

WORKDIR /root/bitcoin

# blockchain location
VOLUME /root/.bitcoin

# mainnnet
EXPOSE 8333
EXPOSE 8332

# testnet
EXPOSE 18333
EXPOSE 18333


ENTRYPOINT ["/root/bitcoin/bin/bitcoind"]
