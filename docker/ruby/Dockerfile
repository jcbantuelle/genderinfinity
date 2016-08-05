FROM ruby:2.3.1

# Install Ubuntu Dependencies
RUN apt-get update && apt-get install -y libpq-dev nodejs postgresql

# Install Gem Dependencies
WORKDIR /tmp
COPY Gemfile /tmp/Gemfile
COPY Gemfile.lock /tmp/Gemfile.lock
RUN bundle install

WORKDIR /app

COPY docker/ruby/startup /usr/local/bin/
RUN chmod 755 /usr/local/bin/startup
CMD "/usr/local/bin/startup"
