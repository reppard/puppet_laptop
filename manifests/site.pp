node default {
  include people::reppard
  include 'golang'

  class { 'nodejs':
  }

  package { 'steroids':
    provider => 'npm',
    require  => Class['nodejs'],
  }

  class { 'rbenv':
    latest => true
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
    ]:
  }
}
