FROM ubuntu:jammy-20220531

ARG LOLMINER_VERSION

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y  \
        curl \
    && mkdir /app \
    && cd /app \
    && curl -O -L https://github.com/Lolliedieb/lolMiner-releases/releases/download/${LOLMINER_VERSION}/lolMiner_v${LOLMINER_VERSION}_Lin64.tar.gz \
    && tar zxvf lolMiner_v${LOLMINER_VERSION}_Lin64.tar.gz \
    && rm lolMiner_v${LOLMINER_VERSION}_Lin64.tar.gz \
    && ln -s "./${LOLMINER_VERSION}" lolMiner

WORKDIR /app/lolMiner
ENTRYPOINT ["/app/lolMiner/lolMiner"]