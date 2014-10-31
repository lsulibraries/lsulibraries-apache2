override['set_fqdn'] = node['razor_metadata']['hostname']
default['apache']['default_site_enabled'] = true
default['apache']['docroot_dir'] = '/var/www/html'

default['unblibraries-firewall']['additional-rules']['apache_standard'] = '-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT'
default['unblibraries-firewall']['additional-rules']['apache_ssl'] = '-A INPUT -p tcp -m tcp --dport 443 -j ACCEPT'
