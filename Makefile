BASE_TAG := declarativesystems.jfrog.io/docker-local/cryptodaemons

# https://github.com/bitcoin/bitcoin/releases
BITCOIN_VERSION := 0.21.0
BITCOIN_HASH := da7766775e3f9c98d7a9145429f2be8297c2672fe5b118fd3dc2411fb48e0032
BITCOIN_TAG := $(BASE_TAG)_bitcoin-$(BITCOIN_VERSION)

# https://github.com/dogecoin/dogecoin/releases
# dogecoin does not make checksums publicly available due to github:
# https://github.com/dogecoin/dogecoin/issues/1372
DOGECOIN_VERSION := 1.14.2
DOGECOIN_TAG := $(BASE_TAG)_dogecoin-$(DOGECOIN_VERSION)

# https://github.com/litecoin-project/litecoin/releases
LITECOIN_VERSION := 0.18.1
LITECOIN_HASH := ca50936299e2c5a66b954c266dcaaeef9e91b2f5307069b9894048acf3eb5751
LITECOIN_TAG := $(BASE_TAG)_litecoin-$(LITECOIN_VERSION)

# https://github.com/monero-project/monero/releases
MONERO_VERSION := 0.17.1.9
MONERO_HASH := 0fb6f53b7b9b3b205151c652b6c9ca7e735f80bfe78427d1061f042723ee6381
MONERO_TAG := $(BASE_TAG)_monero-$(MONERO_VERSION)

build_images: bitcoin_image dogecoin_image litecoin_image monero_image
push_images: bitcoin_push dogecoin_push litecoin_push monero_push

bitcoin_image:
	buildah bud \
		--build-arg BITCOIN_VERSION=$(BITCOIN_VERSION) \
		--build-arg BITCOIN_HASH=$(BITCOIN_HASH) \
		-f bitcoin.Dockerfile \
		--squash \
		-t $(BITCOIN_TAG)

bitcoin_push:
	podman push $(BITCOIN_TAG)


dogecoin_image:
	buildah bud \
		--build-arg DOGECOIN_VERSION=$(DOGECOIN_VERSION) \
		-f dogecoin.Dockerfile \
		--squash \
		-t $(DOGECOIN_TAG)

dogecoin_push:
	podman push $(DOGECOIN_TAG)

litecoin_image:
	buildah bud \
		--build-arg LITECOIN_VERSION=$(LITECOIN_VERSION) \
		--build-arg LITECOIN_HASH=$(LITECOIN_HASH) \
		-f litecoin.Dockerfile \
		--squash \
		-t $(LITECOIN_TAG)

litecoin_push:
	podman push $(LITECOIN_TAG)

monero_image:
	buildah bud \
		--build-arg MONERO_VERSION=$(MONERO_VERSION) \
		--build-arg MONERO_HASH=$(MONERO_HASH) \
		-f monero.Dockerfile \
		--squash \
		-t $(MONERO_TAG)

monero_push:
	podman push $(MONERO_TAG)