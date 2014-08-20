class nagios::install {
	package { [ 'nagios', 'nagios-plugins', 'nagios-plugins-nrpe' ]:
  	ensure  => present,
  }
}
