FROM debian:trixie-20260803-slim

ARG RAVEN_VERSION
ARG RAVEN_HASH
ARG RAVEN_URL

ARG DEBIAN_FRONTEND=noninteractive
RUN RAVEN_ARCHIVE=$(basename "${RAVEN_URL}") \
    && apt-get update \
    && apt-get install -y  \
      curl \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /root/.raven /app \
    && cd /app \
    && curl -L "${RAVEN_URL}" -o ${RAVEN_ARCHIVE} \
    && echo "${RAVEN_HASH} ${RAVEN_ARCHIVE}" | sha256sum --check \
    && tar -zxvf ${RAVEN_ARCHIVE} \
    && rm "${RAVEN_ARCHIVE}" \
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
