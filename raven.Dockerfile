FROM ubuntu:jammy-20220531

ARG RAVEN_VERSION

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y  \
      curl \
      unzip \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /root/.raven /app \
    && cd /app \
    && curl -L "https://github.com/RavenProject/Ravencoin/releases/download/v${RAVEN_VERSION}/raven-${RAVEN_VERSION}-x86_64-linux-gnu.zip" -O \
    && unzip "raven-${RAVEN_VERSION}-x86_64-linux-gnu.zip" \
    && rm "raven-${RAVEN_VERSION}-x86_64-linux-gnu.zip" \
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
