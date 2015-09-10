node default {
  class { 'people': user   => reppard }
  class { 'rbenv':  latest => true }
  class { 'vagrant': }
  class { 'nodejs':
    version      => 'v0.12.2',
    make_install => false,
  }
  class { 'docker':
    tcp_bind    => 'tcp://0.0.0.0:4243',
    socket_bind => 'unix:///var/run/docker.sock',
  }

  rbenv::plugin { 'sstephenson/ruby-build': }
  rbenv::build { '2.1.2': global => true }

  package {
    [
      'ack-grep',
      'findutils',
      'tar',
      'tmux',
      'openssh-server',
      'tig'
    ]:
  }
}
