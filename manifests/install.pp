class nagios::install {
	package { [ 
			'nagios', 
			'nagios-plugins',
			'nagios-plugins-nrpe',
			'nsca'
			 ]:
  	ensure  => present,
  }
	File{"/etc/nagios/conf.d":
		ensure	=>	directory,
		owner		=>	'nagios',
		group		=>	'apache',	
		mode		=>	'775',
		require	=>	Package["nagios"],
	}
	File{"/etc/nagios/private":
		ensure	=>	directory,
		owner		=>	'nagios',
		group		=>	'apache',	
		mode		=>	'770',
		require	=>	Package["nagios"],
	}
	File{"/etc/nagios/objects":
		ensure	=>	directory,
		owner		=>	'nagios',
		group		=>	'apache',	
		mode		=>	'770',
		require	=>	Package["nagios"],
	}
}
