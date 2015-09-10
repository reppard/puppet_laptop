#!/bin/bash

sudo yum update -y
sudo yum install -y puppet ruby ruby-devel wget unzip git
sudo gem install --bindir /usr/bin --no-ri --no-rdoc librarian-puppet
librarian-puppet install
sudo puppet apply --hiera_config hiera.yaml --verbose --debug --modulepath=modules manifests/default.pp
