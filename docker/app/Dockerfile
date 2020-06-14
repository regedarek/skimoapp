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

# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /var/www/skimoapp
RUN mkdir -p $RAILS_ROOT

# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --jobs 20 --retry 5

COPY . .

#RUN RAILS_ENV=production SECRET_TOKEN=test bundle exec rake assets:clobber assets:precompile --trace
#RUN yarn cache clean

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
