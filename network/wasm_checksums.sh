#!/bin/bash

source ./network/variables.sh

echo "Querying code hashes from $CHAINID_1..."
simd query ibc-wasm checksums \
    --home "$CHAIN_DIR/$CHAINID_1" \
    --node "tcp://localhost:$RPCPORT_1"

echo "Querying code hashes from $CHAINID_2..."
simd query ibc-wasm checksums \
    --home "$CHAIN_DIR/$CHAINID_2" \
    --node "tcp://localhost:$RPCPORT_2"