class nagios::plugins::send_sns {

  # sns script from https://github.com/sricola/pyAmazonSNS
  file{"/usr/local/bin/send_sns.py":
    ensure  =>  "present",
    source  =>  "puppet:///modules/nagios/send_sns.py",
    owner   =>  "root",
    group   =>  "root",
    mode    =>  "775",
    require =>  Class["nagios::plugins::send_sns_reqs"],
  }
  include nagios::plugins::send_sns_reqs
}
