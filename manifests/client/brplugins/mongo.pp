class nagios::client::brplugins::mongo{
  
	package{"python-pymongo":
		ensure	=> 	present
	}
	file{"/usr/lib64/nagios/plugins/check_mongodb.py":
		ensure	=>	"present",
		source	=>	"puppet:///modules/nagios/check_mongodb.py",
		owner		=>	"root",
		group		=>	"root",
		mode		=>	"775",
		require	=>	Package["python-pymongo"],
	}
}
