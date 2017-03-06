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
  $mongo_port    = $rocket::params::port,
  $verbose       = $rocket::params::verbose,
  $manage_repos  = $rocket::params::manage_repos,
  $download_path = $rocket::params::download_path,
  $destination   = $rocket::params::destination,
  $mongo_host    = $rocket::params::mongo_host,
  $database_name = $rocket::params::database_name,
  $root_url      = $rocket::params::root_url,
  $port          = $rocket::params::port,
) inherits rocket::params {

  class { 'rocket::packages': }

  class { 'rocket::database':
    port         => $mongo_port,
    verbose      => $verbose,
    manage_repos => $manage_repos,
    require      => Class['rocket::packages']
  }

  class { 'rocket::install':
    download_path => $download_path,
    destination   => $destination,
    require       => Class['rocket::database']
  }

  class { 'rocket::service':
    port          => $port,
    mongo_host    => $mongo_host,
    database_name => $database_name,
    root_url      => $root_url,
    destination   => $destination,
    require       => Class['rocket::install']
  }

}
