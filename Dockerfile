FROM php:cli-alpine
MAINTAINER Yann LUCAS <contact@yann-lucas.fr>

ARG DEPLOYER_VERSION=6.8.0

RUN apk add --update openssh-client rsync

RUN mkdir /deployer

RUN cd /deployer && curl -LO https://deployer.org/releases/v$DEPLOYER_VERSION/deployer.phar \
&& mv deployer.phar /usr/local/bin/dep \
&& chmod +x /usr/local/bin/dep

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["dep"]
