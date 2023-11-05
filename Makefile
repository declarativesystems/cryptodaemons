BASE_TAG := quay.io/declarativesystems/cryptodaemons

# https://github.com/bitcoin/bitcoin/releases
BITCOIN_VERSION := 25.1
BITCOIN_HASH := a978c407b497a727f0444156e397b50491ce862d1f906fef9b521415b3611c8b
BITCOIN_TAG := $(BASE_TAG)_bitcoin:$(BITCOIN_VERSION)

# https://github.com/bzminer/bzminer/releases
BZMINER_VERSION := 17.0.0
BZMINER_TAG := $(BASE_TAG)_bzminer:$(BZMINER_VERSION)

# https://github.com/dogecoin/dogecoin/releases
# dogecoin does not make checksums publicly available due to github:
# https://github.com/dogecoin/dogecoin/issues/1372
DOGECOIN_VERSION := 1.14.6
DOGECOIN_TAG := $(BASE_TAG)_dogecoin:$(DOGECOIN_VERSION)

# https://github.com/kaspanet/kaspad/releases
KASPA_VERSION := 0.12.14
KASPA_TAG := $(BASE_TAG)_kaspa:$(KASPA_VERSION)

# https://github.com/litecoin-project/litecoin/releases
LITECOIN_VERSION := 0.21.2.2
LITECOIN_HASH := d53d429d4a0e36670df3d6c5c4eadfca6aac3d4b447a23106cfd490cfc77e9f2
LITECOIN_TAG := $(BASE_TAG)_litecoin:$(LITECOIN_VERSION)

# https://github.com/Lolliedieb/lolMiner-releases/releases
LOLMINER_VERSION := 1.76a
LOLMINER_TAG := $(BASE_TAG)_lolminer:$(LOLMINER_VERSION)

# https://github.com/JustAResearcher/Meowcoin/releases
MEOWCOIN_VERSION := 1.0.4
MEOWCOIN_TAG := $(BASE_TAG)_meowcoin:$(MEOWCOIN_VERSION)

# https://github.com/monero-project/monero/releases
MONERO_VERSION := 0.18.3.1
MONERO_HASH := 23af572fdfe3459b9ab97e2e9aa7e3c11021c955d6064b801a27d7e8c21ae09d
MONERO_TAG := $(BASE_TAG)_monero:$(MONERO_VERSION)

# https://github.com/RavenProject/Ravencoin/releases
RAVEN_VERSION := 4.6.1-7864c39c2
RAVEN_HASH := 6c6ac6382cf594b218ec50dd9662892dc2d9a493ce151acb2d7feb500436c197
RAVEN_TAG := $(BASE_TAG)_raven:$(RAVEN_VERSION)

# self hosted git doesnt support version munging
# https://git.wownero.com/wownero/wownero/releases
WOWNERO_URL := https://git.wownero.com/attachments/c1de2873-a72d-41d3-a807-d36e8305ea3f
WOWNERO_HASH := a5b2aa0cffa4c7bf82d9d6072aca0bdeb501bdbde33db1d04edb2c4089878e82
WOWNERO_VERSION := 0.11.1.0
WOWNERO_TAG := $(BASE_TAG)_wownero:$(WOWNERO_VERSION)

bitcoin_image:
	buildah bud \
		--build-arg BITCOIN_VERSION=$(BITCOIN_VERSION) \
		--build-arg BITCOIN_HASH=$(BITCOIN_HASH) \
		-f bitcoin.Dockerfile \
		--squash \
		-t $(BITCOIN_TAG)

bitcoin_push:
	podman push $(BITCOIN_TAG)

bzminer_image:
	buildah bud \
		--build-arg BZMINER_VERSION=$(BZMINER_VERSION) \
		-f bzminer.Dockerfile \
		--squash \
		-t $(BZMINER_TAG)

bzminer_push:
	podman push $(BZMINER_TAG)

dogecoin_image:
	buildah bud \
		--build-arg DOGECOIN_VERSION=$(DOGECOIN_VERSION) \
		-f dogecoin.Dockerfile \
		--squash \
		-t $(DOGECOIN_TAG)

dogecoin_push:
	podman push $(DOGECOIN_TAG)

kaspa_image:
	buildah bud \
		--build-arg KASPA_VERSION=$(KASPA_VERSION) \
		-f kaspa.Dockerfile \
		--squash \
		-t $(KASPA_TAG)

kaspa_push:
	podman push $(KASPA_TAG)

litecoin_image:
	buildah bud \
		--build-arg LITECOIN_VERSION=$(LITECOIN_VERSION) \
		--build-arg LITECOIN_HASH=$(LITECOIN_HASH) \
		-f litecoin.Dockerfile \
		--squash \
		-t $(LITECOIN_TAG)

litecoin_push:
	podman push $(LITECOIN_TAG)

lolminer_image:
	buildah bud \
		--build-arg LOLMINER_VERSION=$(LOLMINER_VERSION) \
		-f lolminer.Dockerfile \
		--squash \
		-t $(LOLMINER_TAG)

lolminer_push:
	podman push $(LOLMINER_TAG)

meowcoin_image:
	buildah bud \
		--build-arg MEOWCOIN_VERSION=$(MEOWCOIN_VERSION) \
		-f meowcoin.Dockerfile \
		--squash \
		-t $(MEOWCOIN_TAG)

meowcoin_push:
	podman push $(MEOWCOIN_TAG)

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
		--build-arg RAVEN_HASH=$(RAVEN_HASH) \
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
