FROM ruby:2.3.1

# Install Ubuntu Dependencies
RUN apt-get update && apt-get install -y lsb-release
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
RUN wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add -
RUN apt-get update && apt-get install -y libpq-dev nodejs postgresql-9.5

# Install Gem Dependencies
WORKDIR /tmp
COPY Gemfile /tmp/Gemfile
COPY Gemfile.lock /tmp/Gemfile.lock
RUN bundle install

WORKDIR /app

COPY docker/ruby/startup /usr/local/bin/
RUN chmod 755 /usr/local/bin/startup
CMD "/usr/local/bin/startup"
