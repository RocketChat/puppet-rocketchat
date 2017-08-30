# Packages that are neccesary for Rocket.Chat installation and configuration
class rocketchat::packages(
  Boolean $nodejs_deps,
  Optional[Array[String[1]]] $sys_deps = [],
) {

  class { 'nodejs':
    version    => '4.x',
    build_deps => $nodejs_deps,
    before     => Exec['npm install']
  }

  package { $sys_deps:
    ensure => installed,
  }
}
