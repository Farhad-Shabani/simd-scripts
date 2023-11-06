#!/bin/bash
set -e

# Load shell variables
. ./network/hermes/variables.sh

### Configure the clients and connection
echo "Initiating connection handshake..."
$HERMES_BINARY --config $CONFIG_DIR create connection --a-chain $CHAINID_1 --b-chain $CHAINID_2

sleep 2
