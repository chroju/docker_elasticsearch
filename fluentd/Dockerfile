FROM ruby:alpine
MAINTAINER chroju

RUN apk add --update --no-cache build-base

RUN gem install fluentd -v "~> 0.12.0" --no-ri --no-rdoc

COPY fluent.conf /fluentd/etc/
EXPOSE 5601

CMD /run/kibana/bin/kibana
