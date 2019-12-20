# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include walg::config
class walg::config {
  assert_private()

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
      value => '/usr/local/bin/archive_command.sh %p',
      ;
  }
}
