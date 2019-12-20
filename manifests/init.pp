class walg (
  Boolean $prometheus_exporter = false,
) {
  class { 'walg::install': }
  -> class { 'walg::config' }

  if $prometheus_exporter {
    class { 'walg::prometheus_exporter': }
  }

  contain walg::install, walg::configure, walg::service
  contain walg::prometheus_exporter
}
