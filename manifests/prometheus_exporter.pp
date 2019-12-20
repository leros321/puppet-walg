# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include walg::prometheus_exporter
class walg::prometheus_exporter (
  Stdlib::HttpsUrl     $source,
  String[1]            $checksum,
  Stdlib::Absolutepath $destination = '/usr/local/bin',
) {
  class { 'walg::prometheus_exporter::install': }
  ~> class { 'walg::prometheus_exporter::service': }

  contain walg::prometheus_exporter::install, walg::prometheus_exporter::service
}
