class nagios::plugins::send_sns_reqs{
  # these provide for using AWS sns for SMS notifications
  python::pip{'awscli':
    pkgname => 'awscli',
    require =>  Class["python"],
  }
  python::pip{'boto':
    pkgname => 'boto',
    require =>  Class["python"],
  }
  python::pip{'tornado':
    pkgname => 'tornado',
    require =>  Class["python"],
  }
}
