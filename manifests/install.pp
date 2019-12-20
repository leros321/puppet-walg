# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include walg::install
class walg::install {
  assert_private()

  archive { '/tmp/wal-g.linux-amd64.tar.gz':
    ensure        => present,
    extract       => true,
    extract_path  => $walg::destination,
    source        => $walg::source,
    checksum      => $walg::checksum,
    checksum_type => 'sha256',
    cleanup       => true,
    creates       => "${walg::destination}/wal-g",
  }
  -> file { "${walg::destination}/wal-g":
    ensure => file,
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }
}
