FROM ubuntu:latest

ENV LANG C.UTF-8
ENV releases=1.4.4 \
    TOKEN=1111111111111111 \
    DATAFILE=./root 
    
RUN apt update \
    && apt-get install -y git \
                          openssl \
                          wget \
                          unzip

RUN wget https://github.com/iovxw/rssbot/releases/download/v$releases/rssbot-v$releases-linux.zip \
&& unzip -n rssbot* \
&& rm -rf rssbot-v* \
&& cp rssbot ./bin \
&& ls \
&& cd .. \
&& ls 

CMD [ “./rssbot $DATAFILE $TOKEN” ]
