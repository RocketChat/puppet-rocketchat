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
class rocket(
) inherits rocket::params {

  include rocket::packages

  class { 'rocket::database':
    port         => 27017,
    verbose      => true,
    manage_repos => true,
    require      => Class['rocket::packages']
  }
  class { 'rocket::configuration':
    require => Class['rocket::database']
  }

  class { 'rocket::service':
    require => Class['rocket::configuration']
  }

}
