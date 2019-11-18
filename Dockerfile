FROM ruby:2.6.3-alpine

RUN apk update && apk add --update yarn build-base nodejs postgresql-dev postgresql-client curl-dev tzdata

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN gem install bundler
RUN bundle install --binstubs --without development test
RUN yarn

ENV RAILS_ENV production 
ENV RACK_ENV production
ENV PORT 80

COPY . /app

LABEL maintainer="Kevin Hanna <kevindhanna@live.com>"

# RUN bin/rails db:setup