class rocket::packages {

  class { 'nodejs':
    version => 'v4.5.0'
  }

  package { 'curl':
    ensure => installed,
  }


  package { 'graphicsmagick':
    ensure => installed,
  }

  package { 'build-essential':
    ensure => installed,
  }
}
