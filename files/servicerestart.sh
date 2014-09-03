#!/bin/sh
# Event Handler for Restarting Linux/BSD/Windows Services
case "$1" in
	OK)	
		;;
	WARNING)
		;;
	UNKNOWN)
		;;
	CRITICAL)	

		/usr/lib64/nagios/plugins/check_nrpe -H "$2" -p 5666 -c runcmd -a "$3"
	;;
esac
		
exit 0
