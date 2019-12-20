class walg::install {
  # Install wal-g from github release
  # https://github.com/wal-g/wal-g/releases/download/v0.2.14/wal-g.linux-amd64.tar.gz
  archive { '/tmp/wal-g.linux-amd64.tar.gz':
    ensure        => present,
    extract       => true,
    extract_path  => '/usr/local/bin',
    source        => 'https://github.com/wal-g/wal-g/releases/download/v0.2.14/wal-g.linux-amd64.tar.gz',
    checksum      => '10527abe958bceba888eb209698661a00cb6e24bf324958e887709901f017005',
    checksum_type => 'sha256',
    cleanup       => true,
    creates       => '/usr/local/bin/wal-g',
  }
  -> file { '/usr/local/bin/wal-g':
    ensure => file,
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }
}
