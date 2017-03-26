class rocket::install(
  $download_path = '/tmp',
  $destination = '/opt',
) {
  include wget
  include apt

  $file_path = "${download_path}/rocket.tgz"

  wget::fetch { 'Download stable Rocket.Chat package':
    source      => "https://rocket.chat/releases/${::rocket::package_ensure}/download",
    destination => $file_path,
    verbose     => false,
    before      => Archive[$file_path]
  }

  archive { $file_path:
    path         => $file_path,
    extract      => true,
    extract_path => $destination,
    creates      => "${destination}/server",
  }

  exec { 'npm install':
    cwd     => "${destination}/bundle/programs/server/",
    creates => "${destination}/bundle/programs/server/node_modules/",
    path    => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/puppetlabs/bin:/root/bin',
    require => [Archive[$file_path], Class['rocket::packages']],
  }


}
