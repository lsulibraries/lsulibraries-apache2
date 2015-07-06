override['apache']['mpm'] = 'prefork'

default['apache']['default_site_enabled'] = true
default['apache']['docroot_dir'] = '/var/www/html'

#default['lsulibraries-firewall']['additional-rules']['apache_standard'] = '-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT'
#default['lsulibraries-firewall']['additional-rules']['apache_ssl'] = '-A INPUT -p tcp -m tcp --dport 443 -j ACCEPT'

override['php']['directives'] = {
	"post_max_size" 		=> "256M",
	"upload_max_filesize" 	=> "256M",
	"memory_limit" 			=> "1024M",
	"date.timezone" 		=> "America/Chicago",
	"session.hash_function" => "1",
	"log_errors" 			=> "On"
	#sendmail_path = "/usr/sbin/sendmail -t -i -f libweb@unb.ca"
}


