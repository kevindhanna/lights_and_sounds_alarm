FROM ruby:2.6.3

RUN apk update && apk add build-base nodejs postgresql-dev

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs

COPY . .

LABEL maintainer="Kevin Hanna <kevindhanna@live.com>"

CMD puma -C config/puma.rb