# Class that restarts services that are used by Rocket.Chat
# TODO: Check what distro are we running and adjust service file configuration
class rocket::service {

  file { '/etc/systemd/system/rocket.service':
    ensure  => 'file',
    content => "${module_name}/rocket.service.erb"
  }

  service { 'mongod':
    ensure  => 'running',
    enable  => true,
    require => File['/etc/systemd/system/rocket.service']
  }
}
