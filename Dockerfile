FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libgmp-dev
RUN mkdir /semantics
WORKDIR /semantics
COPY . /semantics
RUN bundle install
