# Class that install and configures MongoDB database for Rocket.Chat
class rocket::database (
  $port,
  $verbose,
  $manage_repos,
  $replset
){

  if ($manage_repos == true) {
    class { '::mongodb::globals':
      manage_package_repo => true,
      before              => Class['::mongodb::server']
    }
  }

  class {'::mongodb::server':
    port           => $port,
    verbose        => $verbose,
    service_manage => false,
    replset        => $replset
  }
}
