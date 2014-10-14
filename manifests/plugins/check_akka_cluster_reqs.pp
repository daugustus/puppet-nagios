class nagios::plugins::check_akka_cluster_reqs{
  package { ['json', 'rest-open-uri']:
    ensure => present,
    provider => 'gem',
    require => Package['rubygems']
  }
}
