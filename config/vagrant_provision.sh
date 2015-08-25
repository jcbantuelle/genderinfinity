#!/bin/bash

# packages may not install without running an update
apt-get update

# - `libpq-dev` needed for 'pg' gem installation, should be rolled back into mudbug .box file
# - `postgresql-contrib-9.1` needed for pgcrypto extension
# - `xvfb` needed for 'headless' gem, as an alternate to a full X11 installation https://github.com/leonid-shevtsov/headless
# - `libqt4-dev` needed for 'capybara-webkit' gem https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit
apt-get install -y libpq-dev postgresql-contrib-9.1 xvfb libqt4-dev

# Install default database.yaml
if [[ ! -e /vagrant/config/database.yml ]]; then
  echo "Installing initial database.yml from database.yml.vagrant"
  sudo -u vagrant cp /vagrant/config/database.yml.vagrant /vagrant/config/database.yml
fi

# Bring in rvm so we aren't installing to the /opt/vagrant_ruby
. /etc/profile.d/rvm.sh
echo "Install RVM Signature"
sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
sudo gpg --export 409B6B1796C275462A1703113804BB82D39DC0E3 | sudo apt-key add -
echo "Upgrading RVM to latest version"
rvmsudo rvm get stable
echo "Reloading RVM"
rvm reload

cd /vagrant

echo "Installing Ruby 2.2.3"
rvm install 2.2.3
rvm use 2.2.3 --default

echo "Installing the necessary version of bundler (1.3.5)"
gem install bundler -v 1.3.5

echo "Running 'bundle'"
rvmsudo -u vagrant bundle
echo "Running 'rake db:create'"
rvmsudo -u vagrant bundle exec rake db:create
echo "Running 'rake db:schema:load'"
rvmsudo -u vagrant bundle exec rake db:schema:load
echo "Running 'rake db:data:load'"
rvmsudo -u vagrant bundle exec rake db:data:load

cat <<eos


## To start your rails server, run these commands:

vagrant ssh -c 'cd /vagrant && rails server'

Visit http://localhost:3000/

eos
