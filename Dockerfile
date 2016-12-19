FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /semantics
WORKDIR /semantics
COPY . /semantics
RUN bundle install
