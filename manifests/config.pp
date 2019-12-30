# @summary Setup postgres archive command
#
# This class install a script for archive command
# and configure postgres to use this script
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

  postgresql::server::config_entry {
    'archive_mode':
      value => 'on',
      ;

    'archive_command':
      value => '/usr/local/bin/archive_command.sh /usr/local/bin/exporter.env %p',
      ;
  }
}
