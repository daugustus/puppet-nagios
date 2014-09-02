define nagios::nrpecheck(
	$args						=	undef,
	$command				=	$name,
	$contact_groups	=	undef,
	$description		= "needs description",
	$ensure					=	undef,
	$host						=	"${::fqdn}",
	$nagios_conf_d	=	$nagios::params::nagios_confd,
	$nrpe_template	=	'check_generic',
	$plugin					=	$name,
	$service_check	=	true,
	$service_groups	=	undef,
	$sudo						=	false,
	$sudo_user			=	undef,
	$templates			=	undef,
	
){

	file { "${nagios::params::nrpe_cfg_dir}/nrpe-${title}.cfg":
    content => template("nagios/nrpe-${nrpe_template}.cfg.erb"),
    ensure  => $ensure,
    group   => $nagios::client::nrpe_group,
    mode    => '0640',
    notify  => Service['nrpe'],
  	owner   => 'root',
  }	
	if $service_check == 'true' {
		@@nagios_service{"${host}-${name}":
			contact_groups	=>	"${contact_groups}",
			check_command =>  "check_nrpe!${::ipaddress}!${plugin}!10",
			ensure  =>  $ensure,
			host_name =>  "${host}",
    	service_description => "${description}",
			servicegroups	=>	"${service_groups}",
			target  =>  "${nagios_conf_d}/service_nrpe_${name}_${host}.cfg"
			use     =>  "${templates}",
		}
	}
}
