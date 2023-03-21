FROM blockstream/elementsd:22.1

COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN mkdir -p /root/.elements/elementsregtest
COPY elements.conf /root/.elements/elements.conf

ENTRYPOINT ["/docker-entrypoint.sh"]