#!/bin/bash
set -e

# Load shell variables
. ./network/hermes/variables.sh

VERSION="{\"fee_version\":\"ics29-1\",\"app_version\":\"ics20-1\"}"

### Configure a fee enabled transfer channel
echo "Initiating channel handshake..."
$HERMES_BINARY --config $CONFIG_DIR create channel --a-chain $CHAINID_1 --a-connection connection-0 \
    --a-port transfer \
    --b-port transfer \
    --channel-version $VERSION

sleep 2
