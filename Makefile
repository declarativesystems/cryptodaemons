BASE_TAG := quay.io/declarativesystems/cryptodaemons

# https://github.com/bitcoin/bitcoin/releases
BITCOIN_VERSION := 31.1
BITCOIN_HASH := b80d9c3e04da78fb6f0569685673418cf686fadba9042d926d13fb87ff503f9e
BITCOIN_TAG := $(BASE_TAG)_bitcoin:$(BITCOIN_VERSION)

# https://github.com/bzminer/bzminer/releases
BZMINER_VERSION := 23.0.2
BZMINER_TAG := $(BASE_TAG)_bzminer:$(BZMINER_VERSION)

# https://github.com/dogecoin/dogecoin/releases
# dogecoin does not make checksums publicly available due to github:
# https://github.com/dogecoin/dogecoin/issues/1372
DOGECOIN_VERSION := 1.14.9
DOGECOIN_TAG := $(BASE_TAG)_dogecoin:$(DOGECOIN_VERSION)

# https://github.com/kaspanet/rusty-kaspa/releases
KASPA_VERSION := 2.0.1
KASPA_TAG := $(BASE_TAG)_kaspa:$(KASPA_VERSION)

# https://github.com/litecoin-project/litecoin/releases
LITECOIN_VERSION := 0.21.5.6
LITECOIN_HASH := 3c0a217651a431ef446641669a0b74ce7dbcd9b9ed1a118fc830b8f6779ee83f
LITECOIN_TAG := $(BASE_TAG)_litecoin:$(LITECOIN_VERSION)

# https://github.com/Lolliedieb/lolMiner-releases/releases
LOLMINER_VERSION := 1.94a
LOLMINER_TAG := $(BASE_TAG)_lolminer:$(LOLMINER_VERSION)

# https://github.com/JustAResearcher/Meowcoin/releases
MEOWCOIN_VERSION := 30.2.7
MEOWCOIN_URL := https://github.com/Meowcoin-Foundation/Meowcoin/releases/download/v30.2.3/meowcoin-30.2.3-x86_64-linux-gnu.tar.gz
MEOWCOIN_TAG := $(BASE_TAG)_meowcoin:$(MEOWCOIN_VERSION)

# https://github.com/monero-project/monero/releases
MONERO_VERSION := 0.18.5.1
MONERO_HASH := 22a7dda7b0cb699fdd6b7674c3b4a4465b337cc98a54983523b759e1e7cc9958
MONERO_TAG := $(BASE_TAG)_monero:$(MONERO_VERSION)

# https://github.com/RavenProject/Ravencoin/releases
RAVEN_VERSION := 4.8.0
RAVEN_FULL_VERSION := $(RAVEN_VERSION)-225491298
RAVEN_HASH := cb359b6a5b42e47068cd655231484fcc763d2f79eae5ea318b029c704a4dc020
RAVEN_TAG := $(BASE_TAG)_raven:$(RAVEN_FULL_VERSION)
RAVEN_URL := https://github.com/RavenProject/Ravencoin/releases/download/v$(RAVEN_VERSION)/raven-$(RAVEN_FULL_VERSION)-x86_64-linux-gnu.tar.gz

# self hosted git doesnt support version munging
# https://codeberg.org/wownero/wownero/releases
WOWNERO_URL := https://codeberg.org/wownero/wownero/releases/download/v0.11.4.0/wownero-x86_64-linux-gnu-v0.11.4.0.tar.bz2
WOWNERO_HASH := 47ae80080e8298407d62e22cabe07cd710291d123155b3a8adf1f11c8931ac39
WOWNERO_VERSION := 0.11.4.0
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
		--build-arg MEOWCOIN_URL=$(MEOWCOIN_URL) \
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
		--build-arg RAVEN_URL=$(RAVEN_URL) \
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
