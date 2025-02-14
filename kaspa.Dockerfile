FROM ubuntu:oracular-20241120

ARG KASPA_VERSION

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y  \
      curl \
      unzip\
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /root/.kaspad /app /app/kaspa-${KASPA_VERSION} \
    && cd /app/kaspa-${KASPA_VERSION} \
    && curl -L "https://github.com/kaspanet/kaspad/releases/download/v${KASPA_VERSION}/kaspad-v${KASPA_VERSION}-linux.zip" -O \
    && unzip "kaspad-v${KASPA_VERSION}-linux.zip" \
    && rm "kaspad-v${KASPA_VERSION}-linux.zip" \
    && cd .. \
    && ln -s "./kaspa-${KASPA_VERSION}" kaspa

WORKDIR /app/kaspa

# blockchain location
VOLUME /root/.kaspad

# mainnnet
EXPOSE 16111

ENTRYPOINT ["/app/kaspa/bin/kaspad"]
