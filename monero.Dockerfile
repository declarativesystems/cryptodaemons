FROM debian:trixie-20251117-slim

ARG MONERO_VERSION
ARG MONERO_HASH
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y \
      curl \
      bzip2 \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /root/.bitmonero /app \
    && cd /app \
    && curl "https://downloads.getmonero.org/cli/monero-linux-x64-v${MONERO_VERSION}.tar.bz2" -O \
    && echo "${MONERO_HASH} monero-linux-x64-v${MONERO_VERSION}.tar.bz2" | sha256sum --check \
    && tar -xjvf "monero-linux-x64-v${MONERO_VERSION}.tar.bz2" \
    && rm "monero-linux-x64-v${MONERO_VERSION}.tar.bz2"  \
    && ln -s "./monero-x86_64-linux-gnu-v${MONERO_VERSION}" monero

WORKDIR /app/monero

# blockchain location
VOLUME /root/.bitmonero

# mainnet
EXPOSE 18080
EXPOSE 18081

# testnet
EXPOSE 28080
EXPOSE 28081

# stagenet
EXPOSE 38080
EXPOSE 38081

ENTRYPOINT ["/app/monero/monerod"]
