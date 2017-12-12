# Packages that are neccesary for Rocket.Chat installation and configuration
class rocketchat::packages {
  class { 'nodejs':
    repo_url_suffix           => '4.x',
    nodejs_dev_package_ensure => 'present',
    npm_package_ensure        => 'present',
    before                    => Exec['npm install'],
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
