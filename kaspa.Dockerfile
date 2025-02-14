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
    && curl -L "https://github.com/kaspanet/rusty-kaspa/releases/download/v${KASPA_VERSION}/rusty-kaspa-v${KASPA_VERSION}-linux-amd64.zip" -O \
    && unzip "rusty-kaspa-v${KASPA_VERSION}-linux-amd64.zip" \
    && rm "rusty-kaspa-v${KASPA_VERSION}-linux-amd64.zip" \
    && cd .. \
    && ln -s "./kaspa-${KASPA_VERSION}" kaspa

WORKDIR /app/kaspa

# blockchain location
VOLUME /root/.kaspad

# mainnnet
EXPOSE 16111

ENTRYPOINT ["/app/kaspa/bin/kaspad"]
