FROM ubuntu:oracular-20241120

ARG DOGECOIN_VERSION

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /root/.dogecoin /app \
    && cd /app \
    && curl -L "https://github.com/dogecoin/dogecoin/releases/download/v${DOGECOIN_VERSION}/dogecoin-${DOGECOIN_VERSION}-x86_64-linux-gnu.tar.gz" -O \
    && tar -zxvf "dogecoin-${DOGECOIN_VERSION}-x86_64-linux-gnu.tar.gz" \
    && rm "dogecoin-${DOGECOIN_VERSION}-x86_64-linux-gnu.tar.gz"  \
    && ln -s "./dogecoin-${DOGECOIN_VERSION}" dogecoin

WORKDIR /app/dogecoin

# blockchain location
VOLUME /root/.dogecoin

# mainnnet
EXPOSE 22555
EXPOSE 22556

# testnet
EXPOSE 44555
EXPOSE 44556


ENTRYPOINT ["/app/dogecoin/bin/dogecoind"]
