FROM ruby:alpine
MAINTAINER chroju

RUN apk add --update --no-cache build-base

RUN gem install fluentd -v "~> 0.12.0" --no-ri --no-rdoc && \
fluent-gem update && \
fluent-gem install fluent-plugin-elasticsearch && \
mkdir /fluent

COPY fluent.conf /fluent/
EXPOSE 24224

CMD fluentd -c ./fluent/fluent.conf -vv
