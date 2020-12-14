FROM ubuntu:latest

ENV LANG C.UTF-8
ENV releases=2.0.0-alpha.7 \
    TOKEN=1111111111111111 
    
RUN apt update \
    && apt-get install -y git \
                          openssl \
                          wget \
                          unzip

RUN wget -O rssbot https://github.com/iovxw/rssbot/releases/download/v2.0.0-alpha.9/rssbot-zh-amd64-linux \
&& chmod 777 rssbot \
&& mv rssbot ./bin  

CMD [ “./rssbot DATAFILE $TOKEN” ]
