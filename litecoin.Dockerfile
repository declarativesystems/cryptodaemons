FROM ubuntu:focal-20210119

ARG LITECOIN_VERSION
ARG LITECOIN_HASH


ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl bzip2
RUN useradd --create-home litecoin --uid 1000

USER litecoin

WORKDIR /home/litecoin
RUN mkdir /home/litecoin/.litecoin

RUN curl -L "https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz" -O \
    && echo "${LITECOIN_HASH} litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum --check \
    && tar -zxvf "litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz" \
    && rm "litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz"  \
    && ln -s "./litecoin-${LITECOIN_VERSION}" litecoin

# blockchain location
VOLUME /home/litecoin/.litecoin

# mainnnet
EXPOSE 22555
EXPOSE 22556

# testnet
EXPOSE 44555
EXPOSE 44556


ENTRYPOINT /home/litecoin/litecoin/bin/litecoind
