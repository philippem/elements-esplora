#!/usr/bin/env bash

# bitcoind
wait-for-it.sh 172.16.231.10:18445 -t 0
# elementsd
wait-for-it.sh 172.16.231.11:18443 -t 0

exec /srv/explorer/run.sh $@
