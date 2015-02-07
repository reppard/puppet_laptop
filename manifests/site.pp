node default {
  include people::reppard
  include golang

  class { 'packer': install_dir => '/usr/local/bin', version => '0.7.5' }
  class { 'rbenv': latest => true }
  rbenv::plugin { 'sstephenson/ruby-build': }
  rbenv::build { '2.1.2': global => true }

  class { 'docker':
    tcp_bind    => 'tcp://0.0.0.0:4243',
    socket_bind => 'unix:///var/run/docker.sock',
  }

  class { 'nodejs': }

  package { 'steroids':
    ensure   => absent,
    provider => 'npm',
    require  => Class['nodejs'],
  }

  package {
    [
      'ack-grep',
      'findutils',
      'tar',
      'tmux',
    ]:
  }
}
