FROM alpine
MAINTAINER chroju

RUN apk add --update --no-cache wget ca-certificates nodejs

RUN cd /run && \
wget https://download.elastic.co/kibana/kibana/kibana-4.5.1-linux-x64.tar.gz && \
tar -xzf kibana-4.5.1-linux-x64.tar.gz && \
mv kibana-4.5.1-linux-x64 kibana && \
rm -rf kibana-4.5.1-linux-x64.tar.gz /run/kibana/node && \
mkdir -p /run/kibana/node/bin && \
ln -s $(which node) /run/kibana/node/bin/node && \
sed -ri "s!^(\#\s*)?(elasticsearch\.url:).*!\2 'http://elasticsearch:9200'!" /run/kibana/config/kibana.yml

EXPOSE 5601

CMD /run/kibana/bin/kibana
