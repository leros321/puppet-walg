# @summary Setup full and incremental backup
#
# This class install one script for incremental backup and
# another for full backup, configure postgres archive_command
# and setup cronjob to perform full backup.
#
# @example
#   include walg::config
class walg::config {
  assert_private()

  include postgresql::server

  file { '/usr/local/bin/archive_command.sh':
    content => file('walg/archive_command.sh'),
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
  }

  file { '/usr/local/bin/cron-full-backup.sh':
    content => epp('walg/cron-full-backup.sh',
      {
        'datadir'      => $postgresql::server::datadir,
      }
    ),
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
  }

  postgresql::server::config_entry {
    'archive_mode':
      value => 'on',
      ;

    'archive_command':
      value => '/usr/local/bin/archive_command.sh /usr/local/bin/exporter.env %p',
      ;
  }

  cron { 'full-backup':
    command     => '/usr/local/bin/cron-full-backup.sh /usr/local/bin/exporter.env 15',
    environment => 'PATH=/usr/local/bin:/usr/bin:/bin',
    user        => 'root',
    minute      => 20,
  }

}
