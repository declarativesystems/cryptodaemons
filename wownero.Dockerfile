FROM debian:trixie-20251117-slim

ARG WOWNERO_URL
ARG WOWNERO_HASH
ARG WOWNERO_VERSION
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y \
      curl \
      bzip2 \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /root/.wownero /app \
    && cd /app \
    && curl "$WOWNERO_URL" -Lo wownero-linux-x64-v${WOWNERO_VERSION}.tar.bz2 \
    && echo "${WOWNERO_HASH} wownero-linux-x64-v${WOWNERO_VERSION}.tar.bz2" | sha256sum --check \
    && tar -xjvf "wownero-linux-x64-v${WOWNERO_VERSION}.tar.bz2" \
    && rm "wownero-linux-x64-v${WOWNERO_VERSION}.tar.bz2"  \
    && ln -s wownero* wownero

WORKDIR /app

# blockchain location
VOLUME /root/.wownero

# p2p
EXPOSE 34567
# rpc
EXPOSE 34568

ENTRYPOINT ["/app/wownero/wownerod"]
