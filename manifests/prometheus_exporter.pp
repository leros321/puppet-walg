# @summary Download and setup a prometheus exporter for backup metrics
#
# This class download a prometheus exporter for wal-g as binary
# and setup a systemd unit to run this exporter
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
