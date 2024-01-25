FROM ubuntu:mantic-20231011

ARG MEOWCOIN_VERSION
ARG MEOWCOIN_URL

ARG DEBIAN_FRONTEND=noninteractive
RUN MEOWCOIN_TARBALL=$(basename ${MEOWCOIN_URL}) \
    && apt-get update \
    && apt-get install -y  \
      curl \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /root/.meowcoin /app /app/meowcoin-${MEOWCOIN_VERSION} \
    && cd /app/meowcoin-${MEOWCOIN_VERSION} \
    && curl -L -O ${MEOWCOIN_URL} \
    && tar -zxvf ${MEOWCOIN_TARBALL} \
    && rm "${MEOWCOIN_TARBALL}" \
    && cd .. \
    && ln -s "./$(basename ${MEOWCOIN_TARBALL} .tar.gz)" meowcoin

WORKDIR /app/meowcoin

# blockchain location
VOLUME /root/.meowcoin

# mainnnet
EXPOSE 8788
EXPOSE 9766

ENTRYPOINT ["/app/meowcoin/bin/meowcoind"]
