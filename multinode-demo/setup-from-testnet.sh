#!/usr/bin/env bash

here=$(dirname "$0")
# shellcheck source=multinode-demo/common.sh
source "$here"/common.sh

set -e

rm -rf "$PAYCHAINS_CONFIG_DIR"/latest-testnet-snapshot
mkdir -p "$PAYCHAINS_CONFIG_DIR"/latest-testnet-snapshot
(
  cd "$PAYCHAINS_CONFIG_DIR"/latest-testnet-snapshot || exit 1
  set -x
  wget http://api.testnet.paychains.com/genesis.tar.bz2
  wget --trust-server-names http://testnet.paychains.com/snapshot.tar.bz2
)

snapshot=$(ls "$PAYCHAINS_CONFIG_DIR"/latest-testnet-snapshot/snapshot-[0-9]*-*.tar.zst)
if [[ -z $snapshot ]]; then
  echo Error: Unable to find latest snapshot
  exit 1
fi

if [[ ! $snapshot =~ snapshot-([0-9]*)-.*.tar.zst ]]; then
  echo Error: Unable to determine snapshot slot for "$snapshot"
  exit 1
fi

snapshot_slot="${BASH_REMATCH[1]}"

rm -rf "$PAYCHAINS_CONFIG_DIR"/bootstrap-validator
mkdir -p "$PAYCHAINS_CONFIG_DIR"/bootstrap-validator


# Create genesis ledger
if [[ -r $FAUCET_KEYPAIR ]]; then
  cp -f "$FAUCET_KEYPAIR" "$PAYCHAINS_CONFIG_DIR"/faucet.json
else
  $paychains_keygen new --no-passphrase -fso "$PAYCHAINS_CONFIG_DIR"/faucet.json
fi

if [[ -f $BOOTSTRAP_VALIDATOR_IDENTITY_KEYPAIR ]]; then
  cp -f "$BOOTSTRAP_VALIDATOR_IDENTITY_KEYPAIR" "$PAYCHAINS_CONFIG_DIR"/bootstrap-validator/identity.json
else
  $paychains_keygen new --no-passphrase -so "$PAYCHAINS_CONFIG_DIR"/bootstrap-validator/identity.json
fi

$paychains_keygen new --no-passphrase -so "$PAYCHAINS_CONFIG_DIR"/bootstrap-validator/vote-account.json
$paychains_keygen new --no-passphrase -so "$PAYCHAINS_CONFIG_DIR"/bootstrap-validator/stake-account.json

$paychains_ledger_tool create-snapshot \
  --ledger "$PAYCHAINS_CONFIG_DIR"/latest-testnet-snapshot \
  --faucet-pubkey "$PAYCHAINS_CONFIG_DIR"/faucet.json \
  --faucet-lamports 500000000000000000 \
  --bootstrap-validator "$PAYCHAINS_CONFIG_DIR"/bootstrap-validator/identity.json \
                        "$PAYCHAINS_CONFIG_DIR"/bootstrap-validator/vote-account.json \
                        "$PAYCHAINS_CONFIG_DIR"/bootstrap-validator/stake-account.json \
  --hashes-per-tick sleep \
  "$snapshot_slot" "$PAYCHAINS_CONFIG_DIR"/bootstrap-validator

$paychains_ledger_tool modify-genesis \
  --ledger "$PAYCHAINS_CONFIG_DIR"/latest-testnet-snapshot \
  --hashes-per-tick sleep \
  "$PAYCHAINS_CONFIG_DIR"/bootstrap-validator
