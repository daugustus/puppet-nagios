class nagios::plugins::check_akka_cluster {

  file{"/usr/lib64/nagios/plugins/check_akka_cluster":
    ensure  =>  "present",
    source  =>  "puppet:///modules/nagios/check_akka_cluster",
    owner   =>  "root",
    group   =>  "root",
    mode    =>  "775",
    require =>  Class["nagios::plugins::check_akka_cluster_reqs"],
  }
  file{"/usr/lib64/nagios/plugins/check_akka_cluster1":
    ensure  =>  "present",
    source  =>  "puppet:///modules/nagios/check_akka_cluster",
    owner   =>  "root",
    group   =>  "root",
    mode    =>  "775",
    require =>  Class["nagios::plugins::check_akka_cluster_reqs"],
  }
  include nagios::plugins::check_akka_cluster_reqs
}
