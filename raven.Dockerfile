FROM ubuntu:focal-20210119

ARG RAVEN_VERSION

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl unzip

RUN mkdir /root/.raven

# NOTE different directory 4.3.2 vs 4.3.2.0
RUN cd /root \
    && curl -L "https://github.com/RavenProject/Ravencoin/releases/download/v4.3.2/raven-${RAVEN_VERSION}-x86_64-linux-gnu.tar.gz" -O \
    && tar -zxvf "raven-${RAVEN_VERSION}-x86_64-linux-gnu.tar.gz" \
    && rm "raven-${RAVEN_VERSION}-x86_64-linux-gnu.tar.gz" \
    && ln -s "./raven-${RAVEN_VERSION}" raven

WORKDIR /root/raven

# blockchain location
VOLUME /root/.raven

# mainnnet
EXPOSE 8766
EXPOSE 8767

# testnet
EXPOSE 18766
EXPOSE 18767

ENTRYPOINT ["/root/raven/bin/ravend"]
