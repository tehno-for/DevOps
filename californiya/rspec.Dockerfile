FROM ruby:3.1.1-alpine3.14
MAINTAINER  Rustam Sharipov <keoroot@gmail.com>

RUN apk add --no-cache build-base ruby-nokogiri
RUN gem install rspec capybara selenium-webdriver
ENTRYPOINT [ "rspec" ]