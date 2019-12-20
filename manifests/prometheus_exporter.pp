class walg::prometheus_exporter {
  class { 'walg::prometheus_exporter::install': }
  ~> class { 'walg::prometheus_exporter::service': }

  contain walg::prometheus_exporter::install, walg::prometheus_exporter::service
}
