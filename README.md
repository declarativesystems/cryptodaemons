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
podman run declarativesystems.jfrog.io/docker-local/cryptodaemons_bitcoin:$VERSION
```

### Dogecoin

```shell
podman run declarativesystems.jfrog.io/docker-local/cryptodaemons_dogecoin:$VERSION
```

### Litecoin

```shell
podman run declarativesystems.jfrog.io/docker-local/cryptodaemons_litecoin:$VERSION
```

### Monero

```shell
podman run declarativesystems.jfrog.io/docker-local/cryptodaemons_monerocoin:$VERSION
```
