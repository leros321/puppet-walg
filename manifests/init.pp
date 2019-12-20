# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include walg
class walg (
  Stdlib::HTTPSUrl     $source,
  String[1]            $checksum,
  Stdlib::Absolutepath $destination = '/usr/local/bin',
  Boolean              $prometheus_exporter = false,
) {
  class { 'walg::install': }
  -> class { 'walg::config': }

  if $prometheus_exporter {
    class { 'walg::prometheus_exporter': }
  }

  contain walg::install, walg::config
  contain walg::prometheus_exporter
}
