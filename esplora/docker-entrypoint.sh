#!/usr/bin/env bash

# bitcoind
# PUT YOUR IP HERE 
# wait-for-it.sh 10.10.37.66:18445 -t 0
# elementsd
# PUT YOUR IP OF HOST HERE
wait-for-it.sh 10.152.176.171:18886 -t 0

exec /srv/explorer/run.sh $@
