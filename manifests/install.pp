# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include walg::install
class walg::install (
  Stdlib::HTTPSUrl     $source,
  String[1]            $checksum,
  Stdlib::Absolutepath $destination = '/usr/local/bin',
) {
  archive { '/tmp/wal-g.linux-amd64.tar.gz':
    ensure        => present,
    extract       => true,
    extract_path  => $destination,
    source        => $source,
    checksum      => $checksum,
    checksum_type => 'sha256',
    cleanup       => true,
    creates       => "${destination}/wal-g",
  }
  -> file { "${destination}/wal-g":
    ensure => file,
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }
}
