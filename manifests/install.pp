class nagios::install {
	package { [ 
			'nagios', 
			'nagios-plugins',
			'nagios-plugins-nrpe',
			'nsca'
			 ]:
  	ensure  => present,
  }
}
