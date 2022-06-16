BASE_TAG := declarativesystems/cryptodaemons

# https://github.com/bitcoin/bitcoin/releases
BITCOIN_VERSION := 23.0
BITCOIN_HASH := 2cca490c1f2842884a3c5b0606f179f9f937177da4eadd628e3f7fd7e25d26d0
BITCOIN_TAG := $(BASE_TAG)_bitcoin:$(BITCOIN_VERSION)

# https://github.com/Chia-Network/chia-blockchain/releases
# no checksums
CHIA_VERSION := 1.0.3
CHIA_TAG := $(BASE_TAG)_chia:$(CHIA_VERSION)


# https://github.com/dogecoin/dogecoin/releases
# dogecoin does not make checksums publicly available due to github:
# https://github.com/dogecoin/dogecoin/issues/1372
DOGECOIN_VERSION := 1.14.2
DOGECOIN_TAG := $(BASE_TAG)_dogecoin:$(DOGECOIN_VERSION)

# https://github.com/electroneum/electroneum/releases
ELECTRONEUM_VERSION := 3.3.1.0
ELECTRONEUM_TAG := $(BASE_TAG)_electroneum:$(ELECTRONEUM_VERSION)

# https://github.com/litecoin-project/litecoin/releases
LITECOIN_VERSION := 0.18.1
LITECOIN_HASH := ca50936299e2c5a66b954c266dcaaeef9e91b2f5307069b9894048acf3eb5751
LITECOIN_TAG := $(BASE_TAG)_litecoin:$(LITECOIN_VERSION)

# https://github.com/monero-project/monero/releases
MONERO_VERSION := 0.17.1.9
MONERO_HASH := 0fb6f53b7b9b3b205151c652b6c9ca7e735f80bfe78427d1061f042723ee6381
MONERO_TAG := $(BASE_TAG)_monero:$(MONERO_VERSION)

# https://github.com/RavenProject/Ravencoin
RAVEN_VERSION := 4.3.2.0
RAVEN_TAG := $(BASE_TAG)_raven:$(RAVEN_VERSION)

# self hosted git doesnt support version munging
# https://git.wownero.com/wownero/wownero
WOWNERO_URL := https://git.wownero.com/attachments/ff0be4f5-37b6-4208-aee3-0ca4c8e97c89
WOWNERO_HASH := 709b905cf853035b1e1660f9de54be44ef4fcfef3924489bff38dc090866ff58
WOWNERO_VERSION := 0.9.2.2
WOWNERO_TAG := $(BASE_TAG)_wownero:$(WOWNERO_VERSION)


XMRIG_VERSION := 6.9.0
XMRIG_HASH := 2d67dd33adeb42ee4aa467d5638b0809b6ab1e0f88180e67bcc97a4fe21aa822
XMRIG_TAG := $(BASE_TAG)_xmrig:$(XMRIG_VERSION)

build_images: bitcoin_image chia_image dogecoin_image electroneum_image litecoin_image monero_image raven_image wownero_image xmrig_image
push_images: bitcoin_push chia_push dogecoin_push electroneum_push litecoin_push monero_push raven_push wownero_push xmrig_push

bitcoin_image:
	buildah bud \
		--build-arg BITCOIN_VERSION=$(BITCOIN_VERSION) \
		--build-arg BITCOIN_HASH=$(BITCOIN_HASH) \
		-f bitcoin.Dockerfile \
		--squash \
		-t $(BITCOIN_TAG)

bitcoin_push:
	podman push $(BITCOIN_TAG)

chia_image:
	buildah bud \
		--build-arg CHIA_VERSION=$(CHIA_VERSION) \
		-f chia.Dockerfile \
		--squash \
		-t $(CHIA_TAG)

chia_push:
	podman push $(CHIA_TAG)

dogecoin_image:
	buildah bud \
		--build-arg DOGECOIN_VERSION=$(DOGECOIN_VERSION) \
		-f dogecoin.Dockerfile \
		--squash \
		-t $(DOGECOIN_TAG)

dogecoin_push:
	podman push $(DOGECOIN_TAG)

electroneum_image:
	buildah bud \
		--build-arg ELECTRONEUM_VERSION=$(ELECTRONEUM_VERSION) \
		-f electroneum.Dockerfile \
		--squash \
		-t $(ELECTRONEUM_TAG)

electroneum_push:
	podman push $(ELECTRONEUM_TAG)

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

raven_image:
	buildah bud \
		--build-arg RAVEN_VERSION=$(RAVEN_VERSION) \
		-f raven.Dockerfile \
		--squash \
		-t $(RAVEN_TAG)

raven_push:
	podman push $(RAVEN_TAG)

wownero_image:
	buildah bud \
		--build-arg WOWNERO_URL=$(WOWNERO_URL) \
		--build-arg WOWNERO_HASH=$(WOWNERO_HASH) \
		--build-arg WOWNERO_VERSION=$(WOWNERO_VERSION) \
		-f wownero.Dockerfile \
		--squash \
		-t $(WOWNERO_TAG)

wownero_push:
	podman push $(WOWNERO_TAG)


xmrig_image:
	buildah bud \
		--build-arg XMRIG_VERSION=$(XMRIG_VERSION) \
		--build-arg XMRIG_HASH=$(XMRIG_HASH) \
		-f xmrig.Dockerfile \
		--squash \
		-t $(XMRIG_TAG)

xmrig_push:
	podman push $(XMRIG_TAG)
