class rocket::params {
  $port           = 80
  $verbose        = false
  $manage_repos   = true
  $download_path  = '/tmp'
  $destination    = '/opt'
  $package_ensure = 'latest'
  $mongo_host     = 'localhost'
  $mongo_port     = 27017
  $nodejs_deps    = true
  $database_name  = 'rocket_chat'
  $root_url       = 'http://rocket.com'
}
