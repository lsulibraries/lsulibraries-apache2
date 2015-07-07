name             'lsulibraries-apache2'
maintainer       'LSU Libraries'
maintainer_email 'jpeak5@lsu.edu'
license          'All rights reserved'
description      'Apache2 webserver wrapper recipe for LAMP stack'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "php"
depends "apache2"
#depends "lsulibraries-users"
#depends "lsulibraries-munin"
#depends "hostname"
