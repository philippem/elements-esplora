#!/usr/bin/env bash

wait-for-it.sh bitcoind:18445 -t 0

exec /usr/local/bin/elementsd
