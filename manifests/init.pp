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
  $mongo_port = $rocket::params::port,
  $verbose = $rocket::params::verbose,
  $manage_repos = $rocket::params::manage_repos,
  $download_path = $rocket::params::download_path,
  $destination = $rocket::params::destination
) inherits rocket::params {

  class { 'rocket::packages': }

  class { 'rocket::database':
    port         => $mongo_port,
    verbose      => $verbose,
    manage_repos => $manage_repos,
    replset      => '001-rs',
    require      => Class['rocket::packages']
  }

  class { 'rocket::install':
    download_path => $download_path,
    destination   => $destination,
    require       => Class['rocket::database']
  }

  class { 'rocket::service':
    require => Class['rocket::install']
  }

}
