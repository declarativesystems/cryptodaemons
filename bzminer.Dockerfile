FROM debian:bookworm-20231030

ARG BZMINER_VERSION

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y  \
        curl \
        ocl-icd-opencl-dev \
    && mkdir /app \
    && cd /app \
    && curl -O -L https://github.com/bzminer/bzminer/releases/download/v${BZMINER_VERSION}/bzminer_v${BZMINER_VERSION}_linux.tar.gz \
    && tar zxvf bzminer_v${BZMINER_VERSION}_linux.tar.gz \
    && rm bzminer_v${BZMINER_VERSION}_linux.tar.gz \
    && ln -s "./bzminer_v${BZMINER_VERSION}_linux" bzminer

WORKDIR /app/bzminer
ENTRYPOINT ["/app/bzminer/bzminer"]