# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include walg::prometheus_exporter::install
class walg::prometheus_exporter::install {
  # Install prometheus exporter
  # https://github.com/camptocamp/wal-g-prometheus-exporter/releases/
  archive { '/usr/local/bin/wal-g-prometheus-exporter':
    ensure        => present,
    source        => 'https://github.com/camptocamp/wal-g-prometheus-exporter/releases/download/0.0.2/wal-g-prometheus-exporter',
    checksum      => 'bdd5c525c86fffde1978ada40cb19a041870246c1d980ed90445d0b15b829404',
    checksum_type => 'sha256',
    cleanup       => false,
    creates       => '/usr/local/bin/wal-g-prometheus-exporter',
  }
  -> file { '/usr/local/bin/wal-g-prometheus-exporter':
    ensure => file,
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }
}
