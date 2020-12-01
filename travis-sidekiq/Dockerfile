FROM ruby:2.6.6-slim

LABEL maintainer Travis CI GmbH <support+monitor-docker-images@travis-ci.com>

# packages required for bundle install
RUN ( \
   apt-get update ; \
   apt-get install -y --no-install-recommends git make gcc g++ \
   && rm -rf /var/lib/apt/lists/* \
)

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile      /app
COPY Gemfile.lock /app

RUN bundler install --verbose --retry=3 --deployment --without development test

COPY . /app

CMD ["/bin/bash", "-c", "bundle exec thin start -R config.ru -e ${RACK_ENV} -p ${PORT:-4500}"]
