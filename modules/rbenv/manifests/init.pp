class rbenv {

  file { '/etc/profile.d/rbenv.sh':
      ensure => present,
      owner => 'root',
      group => 'wheel',
      mode => '0644',
      source =>  'puppet:///modules/rbenv/rbenv.sh',
      require => File['/etc/profile.d'];
  }

  file { '/opt/rbenv/plugins':
    ensure  => directory,
    owner   => 'root',
    group   => 'wheel',
    mode    => '0755',
    require => Vcsrepo['/opt/rbenv'];
  }

  file { '/opt/rbenv/shims':
    ensure  => directory,
    owner   => 'root',
    group   => 'wheel',
    mode    => '0755',
    require => Vcsrepo['/opt/rbenv'];
  }

  vcsrepo { '/opt/rbenv':
    ensure   => present,
    provider => git,
    owner    => 'root',
    group    => 'wheel',
    source   => 'https://github.com/rbenv/rbenv.git';
  }

  vcsrepo { '/opt/rbenv/plugins/ruby-build':
    ensure   => present,
    provider => git,
    owner    => 'root',
    group    => 'wheel',
    source   => 'https://github.com/rbenv/ruby-build.git';
  }

  exec { '/opt/rbenv/bin/rbenv install -f 2.7.0':
    creates     => '/opt/rbenv/versions/2.7.0',
    timeout     => 1800,
    environment => 'RBENV_ROOT=/opt/rbenv';
  }

  exec { '/opt/rbenv/bin/rbenv global 2.7.0':
    creates     => '/opt/rbenv/version',
    timeout     => 300,
    environment => 'RBENV_ROOT=/opt/rbenv',
    require     => Exec['/opt/rbenv/bin/rbenv install -f 2.7.0'];
  }

}