FROM ubuntu:jammy-20220531

ARG MEOWCOIN_VERSION

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y  \
      curl \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /root/.meowcoin /app /app/meowcoin-${MEOWCOIN_VERSION} \
    && cd /app/meowcoin-${MEOWCOIN_VERSION} \
    && curl -L "https://github.com/JustAResearcher/Meowcoin/releases/download/V${MEOWCOIN_VERSION}/MEOW-${MEOWCOIN_VERSION}-CLI-x86_64-linux-gnu.tar.gz"  -O \
    && tar -zxvf "MEOW-${MEOWCOIN_VERSION}-CLI-x86_64-linux-gnu.tar.gz" \
    && rm "MEOW-${MEOWCOIN_VERSION}-CLI-x86_64-linux-gnu.tar.gz" \
    && cd .. \
    && ln -s "./meowcoin-${MEOWCOIN_VERSION}" meowcoin

WORKDIR /app/meowcoin

# blockchain location
VOLUME /root/.meowcoin

# mainnnet
EXPOSE 8788
EXPOSE 9766

ENTRYPOINT ["/app/meowcoin/meowcoind"]
