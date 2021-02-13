FROM ubuntu:focal-20210119

ARG DOGECOIN_VERSION

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl bzip2
RUN useradd --create-home dogecoin --uid 1000

USER dogecoin

WORKDIR /home/dogecoin
RUN mkdir /home/dogecoin/.dogecoin

RUN curl -L "https://github.com/dogecoin/dogecoin/releases/download/v${DOGECOIN_VERSION}/dogecoin-${DOGECOIN_VERSION}-x86_64-linux-gnu.tar.gz" -O \
    && tar -zxvf "dogecoin-${DOGECOIN_VERSION}-x86_64-linux-gnu.tar.gz" \
    && rm "dogecoin-${DOGECOIN_VERSION}-x86_64-linux-gnu.tar.gz"  \
    && ln -s "./dogecoin-${DOGECOIN_VERSION}" dogecoin

# blockchain location
VOLUME /home/dogecoin/.dogecoin

# mainnnet
EXPOSE 22555
EXPOSE 22556

# testnet
EXPOSE 44555
EXPOSE 44556


ENTRYPOINT /home/dogecoin/dogecoin/bin/dogecoind
