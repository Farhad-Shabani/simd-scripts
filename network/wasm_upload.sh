#!/bin/bash

source ./network/variables.sh

echo "Uploading WASM file to $CHAINID_1 ..."
simd tx ibc-wasm store-code $WASM_FILE \
    --title sov_celestia_cw --chain-id $CHAINID_1 \
    --node "tcp://localhost:$RPCPORT_1" \
    --home "$CHAIN_DIR/$CHAINID_1" \
    --from rly1 --keyring-backend test \
    --summary "test" \
    --gas auto --fees 1000016stake -y

sleep 1
echo "Voting on WASM file on $CHAINID_1 ..."
simd tx gov deposit 1 100000000stake \
    --chain-id $CHAINID_1 \
    --node tcp://localhost:$RPCPORT_1 \
    --home "$CHAIN_DIR/$CHAINID_1" \
    --from val1 --keyring-backend test --gas auto -y
sleep 1
simd tx gov vote 1 yes \
    --chain-id $CHAINID_1 \
    --node tcp://localhost:$RPCPORT_1 \
    --home "$CHAIN_DIR/$CHAINID_1" \
    --from val1 --keyring-backend test -y

echo "Uploading WASM file to $CHAINID_2 ..."
simd tx ibc-wasm store-code $WASM_FILE \
    --title sov_celestia_cw --chain-id $CHAINID_2 \
    --node "tcp://localhost:$RPCPORT_2" \
    --home "$CHAIN_DIR/$CHAINID_2" \
    --from val2 --keyring-backend test \
    --summary "test" \
    --gas auto --fees 1000016stake -y

sleep 1
echo "Voting on WASM file on $CHAINID_2 ..."
simd tx gov deposit 1 100000000stake \
    --chain-id $CHAINID_2 \
    --node tcp://localhost:$RPCPORT_2 \
    --home "$CHAIN_DIR/$CHAINID_2" \
    --from val2 --keyring-backend test --gas auto -y

sleep 1
simd tx gov vote 1 yes \
    --chain-id $CHAINID_2 \
    --node tcp://localhost:$RPCPORT_2 \
    --home "$CHAIN_DIR/$CHAINID_2" \
    --from val2 --keyring-backend test -y

sleep 6