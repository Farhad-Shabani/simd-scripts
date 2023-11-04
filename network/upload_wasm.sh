#!/bin/bash

source ./network/variables.sh

echo "Uploading wasm file to $CHAINID_1..."
simd tx ibc-wasm store-code $WASM_FILE \
    --title sov_celestia_cw --chain-id $CHAINID_1 \
    --node "tcp://localhost:$RPCPORT_1" \
    --home "$CHAIN_DIR/$CHAINID_1" \
    --from rly1 --keyring-backend test \
    --summary "test" \
    --gas auto --fees 1000016stake -y

echo "Uploading wasm file to $CHAINID_2..."
simd tx ibc-wasm store-code $WASM_FILE \
    --title sov_celestia_cw --chain-id $CHAINID_2 \
    --node "tcp://localhost:$RPCPORT_2" \
    --home "$CHAIN_DIR/$CHAINID_2" \
    --from rly2 --keyring-backend test \
    --summary "test" \
    --gas auto --fees 1000016stake -y