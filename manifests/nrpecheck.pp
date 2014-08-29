define nagios::nrpecheck(
	$ensure					=	undef,
	$plugin					=	$name,
	$command				=	$name,
	$description		= "needs description",
	$args						=	false,
	$nrpe_template	=	'check_generic',
	$templates			=	undef,
	$contact_groups	=	undef,
	$service_groups	=	undef,
	$host						=	"${::fqdn}",
	$nagios_conf_d	=	$nagios::params::nagios_confd,
	$sudo						=	false,
	$sudo_user			=	undef,
	
){

	file { "${nagios::params::nrpe_cfg_dir}/nrpe-${title}.cfg":
  	owner   => 'root',
    group   => $nagios::client::nrpe_group,
    mode    => '0640',
    content => template("nagios/nrpe-${nrpe_template}.cfg.erb"),
    notify  => Service['nrpe'],
    ensure  => $ensure,
  }	
	@@nagios_service{"${host}-${name}":
		ensure  =>  $ensure,
		host_name =>  "${host}",
		use     =>  "${templates}",
		contact_groups	=>	"${contact_groups}",
		service_groups	=>	"${service_groups}",
    service_description => "${description}",
		check_command =>  "check_nrpe!${::ipaddress}!${plugin}!10",
		target  =>  "${nagios_conf_d}/service_nrpe_${name}_${host}.cfg"
	}
}
