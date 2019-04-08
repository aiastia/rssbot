FROM ubuntu:latest

ENV LANG C.UTF-8
ENV releases=1.4.4 \
    TOKEN=1111111111111111 \
    DATAFILE=./root/datafile
    

WORKDIR /rss

RUN apt update \
    && apt-get install -y git \
                          openssl \
                          wget \
                          unzip

RUN wget https://github.com/iovxw/rssbot/releases/download/v$releases/rssbot-v$releases-linux.zip \
&& unzip -n rssbot-v$releases-linux.zip -d /$WORKDIR \
&& rm -rf rssbot-v$releases-*

CMD [ “./rssbot $DATAFILE $TOKEN” ]
