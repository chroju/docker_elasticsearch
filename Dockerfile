FROM alpine
MAINTAINER chroju

RUN apk add --update --no-cache openjdk8 curl

RUN cd /run && \
curl -s -L -0 https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.3/elasticsearch-2.3.3.tar.gz > elasticsearch-2.3.3.tar.gz && \
tar -xzf elasticsearch-2.3.3.tar.gz && \
rm -rf elasticsearch-2.3.3.tar.gz && \
addgroup -g 3000 elasticsearch && \
adduser -S -u 3000 -g 3000 elasticsearch && \
chown -R elasticsearch:elasticsearch /run/elasticsearch-2.3.3/bin

USER elasticsearch
VOLUME /run/elasticsearch-2.3.3/data
EXPOSE 9200 9200
CMD /run/elasticsearch-2.3.3/bin/elasticsearch
