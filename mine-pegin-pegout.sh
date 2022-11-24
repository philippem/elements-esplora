#!/bin/bash

set -x
set -e

BITCOIN=elements-esplora_bitcoind_1
ELEMENTS=elements-esplora_elementsd_1

docker exec $BITCOIN bitcoin-cli createwallet default || true

# mining address
maddress="mzPAtusyp21ijfmH711dS8BdeDRHK1WkNk"
mprivkey="cTDNkKg9sc1m4asCWgQCSCcZb29pikjEt5sErdtEUSeZeFyPgvik"
docker exec $BITCOIN bitcoin-cli importaddress $maddress
docker exec $BITCOIN bitcoin-cli importprivkey $mprivkey
docker exec $BITCOIN bitcoin-cli generatetoaddress 101 $maddress

# federation address
faddress="n2Dd7MQDYcxKm3uveX9aALZhKyMATPejKM"
fprivkey="cW6Yt5z6V8oyuomA4DKAZnLjSf9ui2h2q2ovfBuz42L2BXdUV3Z8"
docker exec $BITCOIN bitcoin-cli importaddress $faddress
docker exec $BITCOIN bitcoin-cli importprivkey $fprivkey

# change address
caddress="mgjBC4ADH7mcCRh2XZf3fnniGKoB7miGri"
cprivkey="cPLCFcRWdEvmoYGxN9J2xsSV3P1AUwJiwQ5rqGeNRRS5JFxVqy9T"
docker exec $BITCOIN bitcoin-cli importaddress $caddress
docker exec $BITCOIN bitcoin-cli importprivkey $cprivkey

docker exec $ELEMENTS elements-cli createwallet default || true

# also fee address
laddr="Azpsj42AcbjqBRP7NCEHPXrBoQgB3imZAkmh12SfSyQNDHXsbHwJtsrsRd92wjp6W42jDWMKqefKThhk"
lprivkey="cV7nDXhdA6GG89F6iwoGazjmimCV1f8dWBF2PBDAPSzoTYDjVHzz"
docker exec $ELEMENTS elements-cli importaddress $laddr
docker exec $ELEMENTS elements-cli importprivkey $lprivkey
docker exec $ELEMENTS elements-cli generatetoaddress 66 $laddr

# send some BTC to federation
docker exec $BITCOIN bitcoin-cli sendtoaddress $faddress 25

# send some BTC to change
docker exec $BITCOIN bitcoin-cli sendtoaddress $caddress 1

# mine the txes
docker exec $BITCOIN bitcoin-cli generatetoaddress 101 $maddress

# peg in 3.1415 rBTC

ADDRS=$(docker exec $ELEMENTS elements-cli getpeginaddress)
MAINCHAIN=$(echo $ADDRS | jq -r '.mainchain_address')
CLAIMSCRIPT=$(echo $ADDRS | jq -r '.claim_script')

TXID=$(docker exec $BITCOIN bitcoin-cli sendtoaddress $MAINCHAIN 3.1415)

docker exec $BITCOIN bitcoin-cli generatetoaddress 101 $maddress

PROOF=$(docker exec $BITCOIN bitcoin-cli gettxoutproof '''["'''$TXID'''"]''')
RAW=$(docker exec $BITCOIN bitcoin-cli getrawtransaction $TXID)

CLAIMTXID=$(docker exec $ELEMENTS elements-cli claimpegin $RAW $PROOF $CLAIMSCRIPT)

docker exec $ELEMENTS elements-cli generatetoaddress 2 $laddr


# peg out 2.71828 erLBTC
docker exec $ELEMENTS elements-cli sendtomainchain $maddress 2.71828
docker exec $ELEMENTS elements-cli generatetoaddress 2 $laddr

docker exec $BITCOIN bitcoin-cli generatetoaddress 101 $maddress
