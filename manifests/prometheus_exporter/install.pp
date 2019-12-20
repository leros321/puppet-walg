# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include walg::prometheus_exporter::install
class walg::prometheus_exporter::install {
  assert_private()

  archive { "${walg::prometheus_exporter::destination}/wal-g-prometheus-exporter":
    ensure        => present,
    source        => $walg::prometheus_exporter::source,
    checksum      => $walg::prometheus_exporter::checksum,
    checksum_type => 'sha256',
    cleanup       => false,
    creates       => "${walg::prometheus_exporter::destination}/wal-g-prometheus-exporter",
  }
  -> file { "${walg::prometheus_exporter::destination}/wal-g-prometheus-exporter":
    ensure => file,
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }
}
