#!/bin/bash

sudo yum update -y

sudo yum install -y \
  --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo yum install -y puppet ruby ruby-devel wget unzip git

sudo gem install --bindir /usr/bin --no-ri --no-rdoc librarian-puppet

librarian-puppet install

sudo puppet apply \
  --hiera_config hiera.yaml \
  --verbose --debug \
  --modulepath=modules manifests/default.pp
