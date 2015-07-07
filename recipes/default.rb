#
# Cookbook Name:: lsulibraries-apache2
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#include_recipe "hostname"
#include_recipe "lsulibraries-essentials"

include_recipe "apache2"
include_recipe "selinux::permissive"

#include_recipe "lsulibraries-users::sysadmin"
#include_recipe "lsulibraries-users::developers"
#include_recipe "lsulibraries-users::applications"
#include_recipe "lsulibraries-munin"

template "#{node['apache']['dir']}/sites-available/000-default" do
  source   'default-site.erb'
  owner    'root'
  group    node['apache']['root_group']
  mode     '0644'
  notifies :restart, 'service[apache2]'
end

directory "#{node['apache']['docroot_dir']}" do
  owner #{node['apache']['user']}
  group #{node['apache']['user']}
  mode 02775
end

# Add default page.
#
template "#{node['apache']['docroot_dir']}/index.php" do
 source "index.php.erb"
 owner #{node['apache']['user']}
 group #{node['apache']['user']}
 mode 00775
end

file "#{node['apache']['docroot_dir']}/index.html" do
  action :delete
end

