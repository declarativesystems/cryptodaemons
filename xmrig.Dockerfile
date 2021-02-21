FROM ubuntu:focal-20210119

ARG XMRIG_VERSION
ARG XMRIG_HASH
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl bzip2

RUN cd /root \
    && curl -L "https://github.com/xmrig/xmrig/releases/download/v${XMRIG_VERSION}/xmrig-${XMRIG_VERSION}-focal-x64.tar.gz" -O \
    && echo "${XMRIG_HASH} xmrig-${XMRIG_VERSION}-focal-x64.tar.gz" | sha256sum --check \
    && tar -zxvf "xmrig-${XMRIG_VERSION}-focal-x64.tar.gz" \
    && rm "xmrig-${XMRIG_VERSION}-focal-x64.tar.gz"  \
    && ln -s "./xmrig-${XMRIG_VERSION}" xmrig

WORKDIR /root/xmrig

ENTRYPOINT ["/root/xmrig/xmrig"]
