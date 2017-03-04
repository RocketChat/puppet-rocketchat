# Packages that are neccesary for Rocket.Chat installation and configuration
class rocket::packages {

  class { 'nodejs':
    repo_url_suffix => '4.x',
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
