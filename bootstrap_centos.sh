#!/bin/bash

# Install system deps for puppet stuffs
sudo yum install -y puppet ruby ruby-devel wget unzip git

# Install Librarian
gem install --no-ri --no-rdoc bundler
bundle install

# Use Librarian to pull down modules and puppet apply
librarian-puppet install
sudo puppet apply --verbose --debug --modulepath=modules manifests/site.pp
