FROM debian:trixie-20251117-slim

ARG LITECOIN_VERSION
ARG LITECOIN_HASH


ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
  && apt-get install -y curl \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir /root/.litecoin /app \
  && cd /app \
  && curl -L "https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz" -O \
  && echo "${LITECOIN_HASH} litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum --check \
  && tar -zxvf "litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz" \
  && rm "litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz"  \
  && ln -s "./litecoin-${LITECOIN_VERSION}" litecoin

WORKDIR /app/litecoin

# blockchain location
VOLUME /root/.litecoin

# mainnnet
EXPOSE 9332
EXPOSE 9333

# testnet
EXPOSE 19332
EXPOSE 19335

ENTRYPOINT ["/app/litecoin/bin/litecoind"]
