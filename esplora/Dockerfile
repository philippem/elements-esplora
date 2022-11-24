FROM blockstream/esplora:latest

# temporary
RUN apt-get -yqq update \
&& apt-get -yqq install vim

COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh

COPY bitcoin-regtest-explorer.conf.in /srv/explorer/source/contrib/
COPY liquid-regtest-explorer.conf.in /srv/explorer/source/contrib/

ENTRYPOINT ["/docker-entrypoint.sh"]
