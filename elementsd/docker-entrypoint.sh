#!/usr/bin/env bash

wait-for-it.sh bitcoind:18888 -t 0
#wait-for-it.sh elementsd-2:18885 -t 0

exec /usr/local/bin/elementsd
