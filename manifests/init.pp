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
class rocket (
  $port           = $rocket::params::port,
  $root_url       = $rocket::params::root_url,
  $download_path  = $rocket::params::download_path,
  $destination    = $rocket::params::destination,
  $package_ensure = $rocket::params::package_ensure,
  $mongo_host     = $rocket::params::mongo_host,
  $database_name  = $rocket::params::database_name,
  $mongo_port     = $rocket::params::mongo_port,
  $mongo_replset  = $rocket::params::mongo_replset,
  $nodejs_deps    = $rocket::params::nodejs_deps,
  $manage_repos   = $rocket::params::manage_repos,
  $verbose        = $rocket::params::verbose,
) inherits rocket::params {

  include rocket::packages

  if ($mongo_host == 'localhost') {
    class { 'rocket::database':
      port         => $mongo_port,
      verbose      => $verbose,
      manage_repos => $manage_repos,
      require      => Class['rocket::packages'],
      before       => Class['rocket::install'],
    }
  }

  class { 'rocket::install':
    download_path => $download_path,
    destination   => $destination,
  }

  class { 'rocket::service':
    port          => $port,
    mongo_host    => $mongo_host,
    mongo_port    => $mongo_port,
    mongo_replset => $mongo_replset,
    database_name => $database_name,
    root_url      => $root_url,
    destination   => $destination,
    require       => Class['rocket::install']
  }

}
