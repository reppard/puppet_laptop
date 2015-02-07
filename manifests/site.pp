node default {
  #include people::reppard

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
