#FROM docker.io/nvidia/cuda:12.2.2-base-ubuntu22.04
# bzminer requires CUDA 11 - run with CUDA 12 gives error:
# <Warn> CUDA Error: forward compatibility was attempted on non supported HW
FROM docker.io/nvidia/cuda:11.8.0-base-ubuntu22.04

ARG BZMINER_VERSION

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y \
        curl \
        ocl-icd-opencl-dev \
        lshw \
    && mkdir /app \
    && cd /app \
    && curl -O -L https://github.com/bzminer/bzminer/releases/download/v${BZMINER_VERSION}/bzminer_v${BZMINER_VERSION}_linux.tar.gz \
    && tar zxvf bzminer_v${BZMINER_VERSION}_linux.tar.gz \
    && rm bzminer_v${BZMINER_VERSION}_linux.tar.gz \
    && ln -s "./bzminer_v${BZMINER_VERSION}_linux" bzminer

WORKDIR /app/bzminer
ENTRYPOINT ["/app/bzminer/bzminer"]