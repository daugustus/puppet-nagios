class nagios::client::brplugins{

	package{"bc":
		ensure	=> 	present
	}
	file{"/usr/lib64/nagios/plugins/check_memory":
		ensure	=>	"present",
		source	=>	"puppet:///modules/nagios/check_memory",
		owner		=>	"root",
		group		=>	"root",
		mode		=>	"775",
		require	=>	Package["bc"],
	}
	file{"/usr/lib64/nagios/plugins/eventhandlers/servicerestart.sh":
		ensure	=>	"present",
		source	=>	"puppet:///modules/nagios/servicerestart.sh",
		owner		=>	"root",
		group		=>	"root",
		mode		=>	"775",
	}
}
