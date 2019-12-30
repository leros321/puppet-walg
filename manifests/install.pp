# @summary Download wal-g binary
#
# This class download wal-g binary and install it in path
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
