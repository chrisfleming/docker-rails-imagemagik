FROM ruby:2.5-alpine

# RUN apk update && apk add build-base  && \
RUN apk add --virtual .builddeps --update  alpine-sdk curl gzip tar && \
    curl -o ImageMagick-6.9.10-44.tar.gz -L "https://github.com/ImageMagick/ImageMagick6/archive/6.9.10-44.tar.gz" && \
    tar -xzf ImageMagick-6.9.10-44.tar.gz && \
    apk add --update libgcc libgomp libjpeg-turbo-dev libpng-dev && \
    cd ImageMagick6-6.9.10-44 && \
    ./configure && \
    make && \
    make install && \
    gem install rmagick --no-document && \
    apk del .builddeps && \
    cd / && \
    rm -rf ImageMagick-6.9.10-44.tar.gz ImageMagick6-6.9.10-44 && \
    rm -rf /var/cache/apk/*

LABEL maintainer="Chris Fleming <me@chrisfleming.org>"

