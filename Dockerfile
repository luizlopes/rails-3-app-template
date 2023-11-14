FROM ruby:3.2.2-alpine3.17

RUN apk update \
  && apk upgrade \
  && apk add --update \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \ 
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      tzdata \
      yarn \
      && rm -rf /var/cache/apk/*

RUN mkdir -p /var/www/app

WORKDIR /var/www/app

RUN gem install bundler

ADD Gemfile Gemfile.lock ./

RUN bundle install

ADD . /var/www/app
