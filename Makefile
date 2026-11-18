BASE_TAG := quay.io/declarativesystems/cryptodaemons

# https://github.com/bitcoin/bitcoin/releases
BITCOIN_VERSION := 32.1
BITCOIN_HASH := 61545c17c3120fb7412f896d248b11993af04ec8817aad3649c55b2afb044963
BITCOIN_REVISION := 0
BITCOIN_TAG := $(BASE_TAG)_bitcoin:$(BITCOIN_VERSION)-$(BITCOIN_REVISION)

# https://github.com/bzminer/bzminer/releases
BZMINER_VERSION := 23.0.2
BZMINER_TAG := $(BASE_TAG)_bzminer:$(BZMINER_VERSION)

# https://github.com/dogecoin/dogecoin/releases
# dogecoin does not make checksums publicly available due to github:
# https://github.com/dogecoin/dogecoin/issues/1372
DOGECOIN_VERSION := 1.14.9
DOGECOIN_REVISION := 1
DOGECOIN_TAG := $(BASE_TAG)_dogecoin:$(DOGECOIN_VERSION)-$(DOGECOIN_REVISION)

# https://github.com/kaspanet/rusty-kaspa/releases
KASPA_VERSION := 2.1.0
KASPA_REVISION := 0
KASPA_TAG := $(BASE_TAG)_kaspa:$(KASPA_VERSION)-$(KASPA_REVISION)

# https://github.com/litecoin-project/litecoin/releases
LITECOIN_VERSION := 0.21.5.8
LITECOIN_HASH := 43200c9f9d65ebc126ea5833ca9429e144c4b3273da6bb9f4e89fd7450ab1be9
LITECOIN_REVISION := 1
LITECOIN_TAG := $(BASE_TAG)_litecoin:$(LITECOIN_VERSION)-$(LITECOIN_REVISION)

# https://github.com/Lolliedieb/lolMiner-releases/releases
LOLMINER_VERSION := 1.94a
LOLMINER_TAG := $(BASE_TAG)_lolminer:$(LOLMINER_VERSION)

# https://github.com/Meowcoin-Foundation/Meowcoin/releases
# old https://github.com/JustAResearcher/Meowcoin/releases
MEOWCOIN_VERSION := 30.2.8
MEOWCOIN_REVISION := 1
MEOWCOIN_URL := https://github.com/Meowcoin-Foundation/Meowcoin/releases/download/v$(MEOWCOIN_VERSION)/meowcoin-$(MEOWCOIN_VERSION)-x86_64-linux-gnu.tar.gz
MEOWCOIN_TAG := $(BASE_TAG)_meowcoin:$(MEOWCOIN_VERSION)-$(MEOWCOIN_REVISION)

# https://github.com/monero-project/monero/releases
MONERO_VERSION := 0.18.5.4
MONERO_HASH := ba2928962c101b609434bf8c1b43ad59ebe96c5525977284ca599d8bf0f02d10
MONERO_REVISION := 0
MONERO_TAG := $(BASE_TAG)_monero:$(MONERO_VERSION)-$(MONERO_REVISION)

# https://github.com/RavenProject/Ravencoin/releases
RAVEN_VERSION := 4.8.0
RAVEN_FULL_VERSION := $(RAVEN_VERSION)-225491298
RAVEN_HASH := cb359b6a5b42e47068cd655231484fcc763d2f79eae5ea318b029c704a4dc020
RAVEN_REVISION := 1
RAVEN_TAG := $(BASE_TAG)_raven:$(RAVEN_FULL_VERSION)-$(RAVEN_REVISION)
RAVEN_URL := https://github.com/RavenProject/Ravencoin/releases/download/v$(RAVEN_VERSION)/raven-$(RAVEN_FULL_VERSION)-x86_64-linux-gnu.tar.gz

# https://github.com/wownero/wownero/releases
# codeberg down/gone?
# self hosted git doesnt support version munging
# https://codeberg.org/wownero/wownero/releases
WOWNERO_URL := https://github.com/wownero/wownero/releases/download/v0.11.6.0/wownero-x86_64-linux-gnu-v0.11.6.0.tar.bz2
WOWNERO_HASH := 49140ce370a1146a3338fd82335422611a5dde90f983953189470c36caeb58cf
WOWNERO_VERSION := 0.11.6.0
WOWNERO_REVISION := 0
WOWNERO_TAG := $(BASE_TAG)_wownero:$(WOWNERO_VERSION)-$(WOWNERO_REVISION)

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
		--build-arg RAVEN_FULL_VERSION=$(RAVEN_FULL_VERSION) \
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
