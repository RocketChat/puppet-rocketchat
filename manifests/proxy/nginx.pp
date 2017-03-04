class rocker::proxy::nginx (
  $port,
  $host,
  $proxy
) {
  class { 'nginx': }
}
