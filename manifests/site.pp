node default {
  include people::reppard

  class { 'nodejs':
  }

  package { 'steroids':
    provider => 'npm',
    require  => Class['nodejs'],
  }

  package {
    [
      'ack-grep',
      'findutils',
      'tar',
      'tmux',
      'git',
    ]:
  }
}
