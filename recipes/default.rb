#
# Cookbook Name:: unblibraries-apache2
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "unblibraries-essentials"
include_recipe "unblibraries-mysql"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "php::module_curl"
include_recipe "php::module_gd"
include_recipe "php-mcrypt"
include_recipe "apache2"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_proxy"
include_recipe "apache2::mod_proxy_http"
include_recipe "apache2::mod_wsgi"
include_recipe "unblibraries-users::sysadmin"
include_recipe "unblibraries-users::developers"
include_recipe "unblibraries-users::applications"


template "#{node['apache']['dir']}/sites-available/default" do
  source   'default-site.erb'
  owner    'root'
  group    node['apache']['root_group']
  mode     '0644'
  notifies :restart, 'service[apache2]'
end

directory "#{node['apache']['dir']}" do
  owner "www-data"
  group "developers"
  mode 02775
end

file "#{node['apache']['dir']}/index.html" do
  owner "www-data"
  group "developers"
  mode 00665
end

package "php5-ldap" do
  action :install
end

# Update to reasonable PHP.ini variables.
#
template "/etc/php5/apache2/php.ini" do
 source "php.ini.erb"
 owner "root"
 group "root"
 mode 00775
end

# Add default page.
#
template "#{node['apache']['dir']}/index.php" do
 source "index.php.erb"
 owner "vagrant"
 group "vagrant"
 mode 00775
end

file "#{node['apache']['dir']}/index.html" do
  action :delete
end

