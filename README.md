# elements-esplora

An `elementsregtest` network with elementsd, bitcoind, bitcoin esplora, and liquid (elements) esplora.

See https://elementsproject.org/elements-code-tutorial/sidechain

```
docker-compose build
docker-compose up
```

After several seconds, from another shell

```
./mine-pegin-pegout.sh
```

to generate bitcoin and liquid blocks. 25 rBTC will be sent to the federation address, 1 rBTC to the change address, 3.1415 rBTC will be pegged in, and 2.71828 rBTC will be pegged out.

Then, from a browser:

`http://localhost:8094` for Bitcoin esplora
`http://localhost:8092` for Liquid esplora

