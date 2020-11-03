FROM php:cli-alpine
MAINTAINER Yann LUCAS <contact@yann-lucas.fr>

ARG DEPLOYER_VERSION=3.1.2

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

RUN apk add --update openssh-client rsync bash

RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

RUN mkdir /deployer

RUN cd /deployer && curl -LO https://deployer.org/releases/v$DEPLOYER_VERSION/deployer.phar \
&& mv deployer.phar /usr/local/bin/deployer \
&& chmod +x /usr/local/bin/deployer

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["deployer"]
