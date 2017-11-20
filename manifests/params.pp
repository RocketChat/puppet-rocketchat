class rocketchat::params {
  $port           = 80
  $verbose        = false
  $manage_repos   = true
  $download_path  = '/tmp'
  $destination    = '/opt'
  $package_ensure = 'latest'
  $package_source = undef
  $mongo_host     = 'localhost'
  $mongo_port     = 27017
  $mongo_replset  = undef
  $authsource     = undef
  $database_name  = 'rocket_chat'
  $root_url       = 'http://rocket.com'
}
