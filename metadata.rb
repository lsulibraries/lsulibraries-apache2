name             'unblibraries-apache2'
maintainer       'UNB Libraries Systems'
maintainer_email 'jsanford@unb.ca'
license          'All rights reserved'
description      'Apache2 webserver wrapper recipe for UNB Libraries LAMP stack'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "unblibraries-essentials"
depends "unblibraries-mysql"
depends "php"
depends "php-mcrypt"
depends "apache2"
depends "unblibraries-users"
depends "unblibraries-munin"
depends "hostname"
