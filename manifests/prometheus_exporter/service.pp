# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include walg::prometheus_exporter::service
class walg::prometheus_exporter::service {
  assert_private()

  systemd::unit_file { 'wal-g-prometheus-exporter.service':
    content => file('walg/wal-g-prometheus-exporter.service'),
    enable  => true,
    active  => true,
  }
}
