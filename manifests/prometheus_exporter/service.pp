# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include walg::prometheus_exporter::service
class walg::prometheus_exporter::service {
  systemd::unit_file { 'wal-g-prometheus-exporter.service':
    content   => '[Unit]
Description=Wal-g prometheus exporter

[Service]
Restart=always
User=postgres
Group=postgres
EnvironmentFile=/usr/local/bin/exporter.env
ExecStart=/usr/local/bin/wal-g-prometheus-exporter --debug /var/lib/pgsql/12/data/pg_wal/archive_status/

[Install]
WantedBy=multi-user.target',
    enable    => true,
    active    => true,
  }
}
