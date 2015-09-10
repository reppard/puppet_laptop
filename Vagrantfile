# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/centos-7.0-64-puppet"

  config.vm.provision 'shell', inline: 'yum update -y'
  config.vm.provision 'shell', inline: 'yum install -y puppet ruby ruby-devel wget unzip git'
  config.vm.provision 'shell', inline: 'gem install --bindir /usr/bin --no-ri --no-rdoc librarian-puppet'
  config.vm.provision 'shell', inline: 'librarian-puppet install'
  config.vm.provision "puppet"
end
