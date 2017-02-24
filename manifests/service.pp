# Class that restarts services that are used by Rocket.Chat
class rocket::service {

  service { 'mongod':
    ensure => 'running',
    enable => true,
  }
}
