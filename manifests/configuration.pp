class rocket::configuration {

  #file_line { 'replication entry in mongod.conf':
  #  ensure => 'present',
  #  line   => '001-rs',
  #  path   => '/etc/mongod.conf',
  #  notify => Service['mongod']
  # }


}
