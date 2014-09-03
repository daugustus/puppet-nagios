class nagios::export{

	$settings = hiera(settings, {})
	if $settings[nagios_hostgroup] {
		$host_groups = ${settings[nagios_hostgroup]}

	@@nagios_host { "${::fqdn}" :
    address             => $::ipaddress,
    check_command       => 'check-host-alive',
  	ensure              => present,
    hostgroups          => "all-servers,${host_groups}",
    target              => "/etc/nagios/conf.d/host_${::fqdn}.cfg",
    use                 => 'host-alarm-l9,host-check-l9',
  }
}
