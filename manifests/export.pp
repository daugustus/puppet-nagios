class nagios::export(
  $ip_address = $::ipaddress,
	$hostgroups = hiera('nagios_hostgroups'), 
  $templates = hiera('nagios_host_templates')
){

	@@nagios_host { "${::fqdn}" :
    address       => $ip_address,
    check_command => 'check-host-alive',
  	ensure         => present,
    hostgroups    => $hostgroups,
    target        => "/etc/nagios/conf.d/host_${::fqdn}.cfg",
    use           => $templates,
  }
}	
