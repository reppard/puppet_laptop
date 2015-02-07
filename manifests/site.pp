node default {
  include people::reppard
  include nodejs

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
