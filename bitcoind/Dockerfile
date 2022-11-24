FROM blockstream/bitcoind:22.0

RUN mkdir -p /root/.bitcoin/regtest

COPY bitcoin.conf /root/.bitcoin/bitcoin.conf
VOLUME /root/.bitcoin/regtest

EXPOSE 18888 18889

ENTRYPOINT ["/usr/local/bin/bitcoind"]
