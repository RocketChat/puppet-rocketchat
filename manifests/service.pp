# Class that restarts services that are used by Rocket.Chat
# TODO: Check what distro are we running and adjust service file configuration
class rocket::service (
  $port,
  $mongo_host,
  $database_name,
  $root_url,
  $destination,
  $mongo_port,
  $mongo_replset
) {

  file { '/etc/systemd/system/rocket.service':
    ensure  => 'file',
    content => template("${module_name}/rocket.service.erb")
  }

  if ($mongo_host == 'localhost') {
    service { 'mongod':
      ensure => 'running',
      enable => true,
      before => Service['rocket'],
    }
  }

  service { 'rocket':
    ensure  => 'running',
    enable  => true,
    require => File['/etc/systemd/system/rocket.service']
  }
}
