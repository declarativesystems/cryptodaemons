FROM ubuntu:focal-20210119

ARG ELECTRONEUM_VERSION
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl xz-utils libnorm1

RUN mkdir /root/.bitmonero \
    && mkdir /app

RUN cd /app \
    && curl -L "https://github.com/electroneum/electroneum/releases/download/v${ELECTRONEUM_VERSION}/electroneum-release-static-linux-x86_64-U18+-${ELECTRONEUM_VERSION}.tar.xz" -O \
    && tar -xvf "electroneum-release-static-linux-x86_64-U18+-${ELECTRONEUM_VERSION}.tar.xz" \
    && rm "electroneum-release-static-linux-x86_64-U18+-${ELECTRONEUM_VERSION}.tar.xz"

WORKDIR /app

# blockchain location
VOLUME /root/.electroneum

# p2p
EXPOSE 26967
# rpc
EXPOSE 26968

ENTRYPOINT ["/app/electroneumd"]
