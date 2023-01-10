class profile {

  file { '/etc/profile.d':
    ensure => directory,
    owner  => 'root',
    group  => 'wheel',
    mode   => '0755';
  }

  file { '/etc/profile':
      ensure  => present,
      owner   => 'root',
      group   => 'wheel',
      mode    => '0644',
      source  => 'puppet:///modules/profile/profile',
      require => File['/etc/profile.d'];
  }

}