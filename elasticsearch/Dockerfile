FROM alpine
MAINTAINER chroju

RUN apk add --update --no-cache openjdk8 wget ca-certificates

RUN cd /run && \
wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.3/elasticsearch-2.3.3.tar.gz && \
tar -xzf elasticsearch-2.3.3.tar.gz && \
rm -rf elasticsearch-2.3.3.tar.gz && \
addgroup -g 3000 elasticsearch && \
adduser -S -u 3000 -g 3000 elasticsearch

WORKDIR /run/elasticsearch-2.3.3/

RUN for path in data logs config config/scripts plugins; do \
mkdir -p "${path}"; \
chown -R elasticsearch:elasticsearch "${path}"; \
done

RUN /run/elasticsearch-2.3.3/bin/plugin install analysis-kuromoji

COPY elasticsearch.yml /run/elasticsearch-2.3.3/config/

USER elasticsearch
VOLUME /run/elasticsearch-2.3.3/data
EXPOSE 9200 9300
CMD ["/run/elasticsearch-2.3.3/bin/elasticsearch"]
