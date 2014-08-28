class nagios::client::brplugins{

	package{"bc":
		ensure	=> 	present
	}
	file{"/usr/lib64/nagios/plugins/check_memory.sh":
		ensure	=>	"present",
		source	=>	"puppet:///modules/nagios/check_memory.sh",
		owner		=>	"root",
		group		=>	"root",
		mode		=>	"775",
		require	=>	Package["bc"],
	}

}
