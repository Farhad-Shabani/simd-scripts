#!/usr/bin/make -f

init: kill-dev
	@echo "Initializing both blockchains..."
	./network/init.sh
	./network/start.sh

start: 
	@echo "Starting up test network"
	./network/start.sh

kill-dev:
	@echo "Killing simd and removing previous data"
	-@rm -rf ./data
	-@rm -rf ./network/relayer/config/
	-@killall simd 2>/dev/null

hermes-init:
	./network/hermes/restore-keys.sh
	./network/hermes/setup-conn.sh

hermes-restore-keys:
	./network/hermes/restore-keys.sh

hermes-setup-client:
	@echo "Setting up client on both chains..."
	./network/hermes/setup-client.sh

hermes-setup-connection:
	./network/hermes/setup-conn.sh

hermes-setup-channel:
	./network/hermes/setup-channel.sh

hermes-start:
	./network/hermes/start.sh

rly-init:
	@echo "Initializing rly..."
	./network/rly/setup-relayer.sh
	./network/rly/create-path.sh

rly-start:
	./network/rly/start.sh

wasm-upload:
	./network/wasm_upload.sh
	$(MAKE) wasm-code-hashes
	
wasm-code-hashes:
	./network/wasm_code_hashes.sh