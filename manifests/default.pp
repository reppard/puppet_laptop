node default {
  include vault

  class { 'people': user    => reppard }
  class { 'rbenv':  latest  => true }
  class { 'vagrant': }

  class { 'nodejs':
    version      => 'v0.12.2',
    make_install => false,
  }

  class { 'docker':
    tcp_bind    => 'tcp://0.0.0.0:4243',
    socket_bind => 'unix:///var/run/docker.sock',
  }

  class { 'jdk8':
    notify => Exec['install_alternative'],
  }

  exec { 'install_alternative':
    command => '/usr/sbin/alternatives --install /usr/bin/java java /usr/java/default/bin/java 1',
  }
  exec { 'update_alternatives':
    command =>  '/usr/sbin/update-alternatives --set java /usr/java/default/bin/java',
    require => Exec['install_alternative'],
  }

  rbenv::plugin { 'sstephenson/ruby-build': }
  rbenv::build { '2.1.2': global => true }

  package {
    [
      'ack',
      'findutils',
      'gimp',
      'htop',
      'openssh-server',
      'tar',
      'tig',
      'tmux',
    ]:
  }
}
