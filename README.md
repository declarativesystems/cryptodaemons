# cryptodaemons

* bitcoin
* dogecoin
* litecoin
* monero
* raven
* wownero

## Build an image

```shell
make ${coin}_image
```

_where `${coin}` is the name of the coin you want to build_

## Push an images
```shell
make ${coin}_push
```

_where `${coin}` is the name of the coin you want to build_

## Running


### Bitcoin

```shell
podman run \
  -p 8333:8333 \
  --detach \
  --rm \
  --name bitcoin \
  -v /data/cryptodaemons/bitcoin:/root/.bitcoin:z quay.io/declarativesystems/cryptodaemons_bitcoin:$VERSION \
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
  quay.io/declarativesystems/cryptodaemons_dogecoin:$VERSION \
  --server
```

### Litecoin

```shell
podman run \
  -p 9333:9333 \
  --detach \
  --rm \
  --name litecoin \
  -v /data/cryptodaemons/litecoin:/root/.litecoin:z quay.io/declarativesystems/cryptodaemons_litecoin:$VERSION \
  --server
```

### Monero

```shell
podman run \
  -p 18080:18080 \
  --detach \
  --rm \
  --name monero \
  -v /data/cryptodaemons/monero:/root/.bitmonero:z quay.io/declarativesystems/cryptodaemons_monero:$VERSION \
  --server

```

### Raven

```shell
podman run \
  -p 8766:8766 \
  -p 8767:8767 \
  --rm \
  --name raven \
  -v /data/cryptodaemons/raven:/root/.raven:z quay.io/declarativesystems/cryptodaemons_raven:$VERSION \
  	-server -printtoconsole
```

### Wownero

```shell
podman run \
  -p 34567:34567 \
  -p 34568:34568 \
  --rm \
  --name wownero \
  -v /data/cryptodaemons/wownero:/root/.wownero:z quay.io/declarativesystems/cryptodaemons_wownero:0.10.1.0 \
  	--confirm-external-bind \
  	--non-interactive \
  	--public-node \
 	--restricted-rpc \
	--p2p-bind-ip=0.0.0.0 \
  	--p2p-bind-port=34567 \
  	--rpc-bind-ip=0.0.0.0 \
  	--rpc-bind-port=34568
```