# elements-esplora

An `elementsregtest` network with elementsd, bitcoind, bitcoin esplora, and elements (liquid sidechain) esplora.

See https://elementsproject.org/elements-code-tutorial/sidechain

```
docker-compose build
docker-compose up -d bitcoind elementsd
./mine-pegin-pegout.sh
docker-compose up -d bitcoin-esplora elements-esplora
```

Bitcoin and liquid blocks will be mined.
25 rBTC will be sent to the federation address, 1 rBTC to the change address, 3.1415 rBTC will be pegged in, and 2.71828 rBTC will be pegged out.

Then, from a browser:

`http://localhost:8094` for Bitcoin esplora
`http://localhost:8092` for Elements esplora

