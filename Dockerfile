ARG RUBY_VERSION=3.2.2
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

WORKDIR /rails

ENV RAILS_ENV="development" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"


# Throw-away build stage to reduce size of final image
FROM base as build

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential libpq-dev pkg-config

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

WORKDIR /rails

EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]