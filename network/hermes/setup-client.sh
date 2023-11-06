#!/bin/bash
set -e

# Load shell variables
. ./network/hermes/variables.sh

### Create wasm clients on both chains
echo "Creating wasm client on $CHAINID_1"
$HERMES_BINARY --config $CONFIG_DIR create client --host-chain $CHAINID_1 --reference-chain $CHAINID_2

sleep 2

echo "Creating wasm client on $CHAINID_2"
$HERMES_BINARY --config $CONFIG_DIR create client --host-chain $CHAINID_2 --reference-chain $CHAINID_1
