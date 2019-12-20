class walg::config {
  file { '/usr/local/bin/archive_command.sh':
    content => '#!/bin/bash

source /usr/local/bin/exporter.env
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export WALE_S3_PREFIX
export AWS_ENDPOINT
export AWS_S3_FORCE_PATH_STYLE
export AWS_REGION

exec wal-g wal-push $1',
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
