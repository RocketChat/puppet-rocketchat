# Packages that are neccesary for Rocket.Chat installation and configuration
class rocketchat::packages(
  $nodejs_version,
  $nodejs_deps
) {

  class { 'nodejs':
    version    => $nodejs_version,
    build_deps => $nodejs_deps,
    before     => Exec['npm install']
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
