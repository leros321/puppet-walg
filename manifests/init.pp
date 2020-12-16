# @summary Download and setup wal-g
#
# Download and setup wal-g for backup
#
# @example
#   include walg
class walg (
  Stdlib::HTTPSUrl     $source,
  String[1]            $checksum,
  Integer              $retention,
  Stdlib::Absolutepath $destination = '/usr/local/bin',
  Boolean              $prometheus_exporter = false,
  Boolean              $backup_fuse = false,
  Integer              $backup_fuse_threshold_gbytes = 10,
) {
  class { 'walg::install': }
  -> class { 'walg::config': }

  if $prometheus_exporter {
    class { 'walg::prometheus_exporter': }
  }

  contain walg::install, walg::config
  contain walg::prometheus_exporter
}
