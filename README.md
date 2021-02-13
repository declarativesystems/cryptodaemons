# cryptodaemons

* bitcoin
* dogecoin
* litecoin
* monero

## Build all images

```shell
make build_images
```

## Push all images
```shell
make push_images
```

## Running

### Artifactory login

```shell
podman login declarativesystems.jfrog.io
```

### Bitcoin

```shell
podman run \
  -p 8333:8333 \
  --detach \
  --rm \
  --name bitcoin \
  -v /data/cryptodaemons/bitcoin:/root/.bitcoin:z declarativesystems.jfrog.io/docker-local/cryptodaemons_bitcoin:$VERSION \
  --server
```

### Dogecoin

```shell
podman run \
  -p 22556:22556 \
  --detach \
  --rm \
  --name dogecoin \
  -v /data/cryptodaemons/dogecoin:/root/.dogecoin:z \
  declarativesystems.jfrog.io/docker-local/cryptodaemons_dogecoin:$VERSION \
  --server
```

### Litecoin

```shell
podman run \
  -p 9333:9333 \
  --detach \
  --rm \
  --name litecoin \
  -v /data/cryptodaemons/litecoin:/root/.litecoin:z declarativesystems.jfrog.io/docker-local/cryptodaemons_litecoin:$VERSION \
  --server
```

### Monero

```shell
podman run \
  -p 18080:18080 \
  --detach \
  --rm \
  --name monero \
  -v /data/cryptodaemons/monero:/root/.bitmonero:z declarativesystems.jfrog.io/docker-local/cryptodaemons_monero:$VERSION \
  --server

```
