FROM ubuntu:oracular-20241120

ARG RAVEN_VERSION
ARG RAVEN_HASH

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y  \
      curl \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /root/.raven /app \
    && cd /app \
    && curl -L "https://github.com/RavenProject/Ravencoin/releases/download/v$(echo $RAVEN_VERSION | awk 'BEGIN{FS="-"} {print$1}')/raven-${RAVEN_VERSION}-x86_64-linux-gnu.tar.gz" -O \
    && echo "${RAVEN_HASH} raven-${RAVEN_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum --check \
    && tar -zxvf raven-${RAVEN_VERSION}-x86_64-linux-gnu.tar.gz \
    && rm "raven-${RAVEN_VERSION}-x86_64-linux-gnu.tar.gz" \
    && ln -s "./raven-${RAVEN_VERSION}" raven

WORKDIR /app/raven

# blockchain location
VOLUME /root/.raven

# mainnnet
EXPOSE 8766
EXPOSE 8767

# testnet
EXPOSE 18766
EXPOSE 18767

ENTRYPOINT ["/app/raven/bin/ravend"]
