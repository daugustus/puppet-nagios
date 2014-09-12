class nagios::export(
	$hostgroups = hiera('nagios_hostgroups') 
){

	@@nagios_host { "${::fqdn}" :
    address             => $::ipaddress,
    check_command       => 'check-host-alive',
  	ensure              => present,
    hostgroups          => $hostgroups,
    target              => "/etc/nagios/conf.d/host_${::fqdn}.cfg",
    use                 => 'host-alarm-l9,host-check-l9',
  }
}	
