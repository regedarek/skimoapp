FROM ruby:2.7-alpine
MAINTAINER Darek Finster <darek.finster@gmail.com>

RUN apk --update add --virtual build-dependencies \ 
                               build-base \
                               libxml2-dev \
                               libxslt-dev \
                               postgresql-dev \
                               nodejs \
                               yarn \
                               tzdata \
                               vim \
                               && rm -rf /var/cache/apk/*

RUN mkdir /docker-rails
WORKDIR /docker-rails
COPY Gemfile /docker-rails/Gemfile
COPY Gemfile.lock /docker-rails/Gemfile.lock
RUN bundle install
COPY . /docker-rails

EXPOSE 3000 3035

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
