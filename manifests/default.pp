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
      'inkscape',
      'openssh-server',
      'steam',
      'tar',
      'tig',
      'tmux',
      'VirtualBox',
      'vlc',
    ]:
  }

  # Multimedia deps
  package {
    [
     'gstreamer-plugins-bad',
     'gstreamer-plugins-bad-free-extras',
     'gstreamer-plugins-bad-nonfree',
     'gstreamer-plugins-ugly',
     'gstreamer-ffmpeg',
     'libdvdread',
     'libdvdnav',
     'lsdvd',
     'mplayer',
     'mencoder',
     'gstreamer1',
     'gstreamer1-libav',
     'gstreamer1-plugins-bad-free-extras',
     'gstreamer1-plugins-bad-freeworld',
     'gstreamer1-plugins-base-tools',
     'gstreamer1-plugins-good-extras',
     'gstreamer1-plugins-ugly',
     'gstreamer1-plugins-bad-free',
     'gstreamer1-plugins-good',
     'gstreamer1-plugins-base',
    ]:
  }
}
