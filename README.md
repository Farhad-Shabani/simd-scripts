# simd scripts

Boilerplate scripts for bootstrapping two WASM enabled `simd` nodes, uploading client contracts, and setting up IBC transport and relaying.

### Installing simd
Install the `simd` binary from the `feat/wasm-clients` branch of [`ibc-go`](https://github.com/cosmos/ibc-go) repository.

```bash
git clone git@github.com:cosmos/ibc-go.git && cd ibc-go

git checkout feat/wasm-clients

cd ./modules/light-clients/08-wasm

go mod download

mkdir -p /build

go build -mod=readonly -tags "netgo ledger muslc" -trimpath -o /build/ ./...
```

### Setup chains

Bootstrap two `simd` chains. The following will clear any existing chain state under `./data` and create a new environment.
It bootstraps two single validator nodes for different `simd` chains `test-1` and `test-2`.

The scripts create a couple of accounts, both for relayers and demo accounts.

```bash
make init
```

### Upload WASM contracts

Place the light client WASM contracts under `./contracts` and run the following to upload them to the chains,
and make sure `WASM_FILE` in the `./networks/variables.sh` file is set to the correct WASM file name.

```bash
make wasm-upload
```

### Installing Hermes

```bash
cargo install ibc-relayer-cli --bin hermes --locked

hermes version # v1.7.0
```

### Restore keys using Hermes

Restore keys for relayer wallets `rly-1` and `rly-2`.

```bash
make hermes-restore-keys
```

### Setting up IBC transport and relaying

Create a connection from `test-1` to `test-2`. Note, this also creates ibc clients out of the box.

```bash
make hermes-setup-connection
```

Create an incentivized transfer channel.

```bash
make hermes-setup-channel
```

Start relaying.

```bash
make hermes-start
```
