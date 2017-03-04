class rocket::install(
  $download_path = '/tmp',
  $destination = '/opt',
) {
  include wget
  include apt

  $file_path = "${download_path}/rocket.tgz"

  wget::fetch { 'Download stable Rocket.Chat package':
    source      => 'https://rocket.chat/releases/latest/download',
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
    path    => ['/usr/bin', '/usr/sbin',],
    require => [Archive[$file_path], Class['rocket::packages']],
    # notify  => Exec['apt_update']
  }
}
