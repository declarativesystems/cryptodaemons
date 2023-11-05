FROM ubuntu:mantic-20231011

ARG MEOWCOIN_VERSION

ARG DEBIAN_FRONTEND=noninteractive
# note version in GH download dir - missing period!
RUN apt-get update \
    && apt-get install -y  \
      curl \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /root/.meowcoin /app /app/meowcoin-${MEOWCOIN_VERSION} \
    && cd /app/meowcoin-${MEOWCOIN_VERSION} \
    && curl -L -O https://github.com/JustAResearcher/Meowcoin/releases/download/V1.04/meowcoin-${MEOWCOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && tar -zxvf "meowcoin-${MEOWCOIN_VERSION}-x86_64-linux-gnu.tar.gz" \
    && rm "meowcoin-${MEOWCOIN_VERSION}-x86_64-linux-gnu.tar.gz" \
    && cd .. \
    && ln -s "./meowcoin-${MEOWCOIN_VERSION}/meowcoin-${MEOWCOIN_VERSION}" meowcoin

WORKDIR /app/meowcoin

# blockchain location
VOLUME /root/.meowcoin

# mainnnet
EXPOSE 8788
EXPOSE 9766

ENTRYPOINT ["/app/meowcoin/bin/meowcoind"]
