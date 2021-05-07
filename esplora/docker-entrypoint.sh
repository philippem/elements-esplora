#!/usr/bin/env bash

wait-for-it.sh bitcoind:18888 -t 0
wait-for-it.sh elementsd:18884 -t 0

exec /srv/explorer/run.sh $@
