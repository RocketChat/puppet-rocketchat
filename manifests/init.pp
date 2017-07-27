# == Class: rocket
#
# Main class for Rocket.Chat installation and configuration
#
# === Parameters

# === Authors
#
# Karol Kozakowski <cosaquee@gmail.com>
#
# === Copyright
#
# Copyright 2017 Karol Kozakowski
#
class rocketchat (
  $port           = $rocketchat::params::port,
  $root_url       = $rocketchat::params::root_url,
  $download_path  = $rocketchat::params::download_path,
  $destination    = $rocketchat::params::destination,
  $package_ensure = $rocketchat::params::package_ensure,
  $package_source = $rocketchat::params::package_source,
  $mongo_host     = $rocketchat::params::mongo_host,
  $database_name  = $rocketchat::params::database_name,
  $mongo_port     = $rocketchat::params::mongo_port,
  $mongo_replset  = $rocketchat::params::mongo_replset,
  $authsource     = $rocketchat::params::authsource,
  $nodejs_deps    = $rocketchat::params::nodejs_deps,
  $manage_repos   = $rocketchat::params::manage_repos,
  $verbose        = $rocketchat::params::verbose,
) inherits rocketchat::params {

  class { 'rocketchat::packages':
    nodejs_deps => $nodejs_deps
  }

  if ($mongo_host == 'localhost') {
    class { 'rocketchat::database':
      port         => $mongo_port,
      verbose      => $verbose,
      manage_repos => $manage_repos,
      require      => Class['rocketchat::packages'],
      before       => Class['rocketchat::install'],
    }
  }

  class { 'rocketchat::install':
    download_path  => $download_path,
    destination    => $destination,
    package_ensure => $package_ensure,
    package_source => $package_source
  }

  class { 'rocketchat::service':
    port          => $port,
    mongo_host    => $mongo_host,
    mongo_port    => $mongo_port,
    mongo_replset => $mongo_replset,
    authsource    => $authsource,
    database_name => $database_name,
    root_url      => $root_url,
    destination   => $destination,
    require       => Class['rocketchat::install']
  }
}
