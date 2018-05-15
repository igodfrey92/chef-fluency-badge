#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#include the websites recipe
#include_recipe 'apache::websites'

#set package varibale to correct package name based on platform family
if node['platform_family'] == "rhel"
	package = "httpd"
elsif node['platform_family'] == 'debian'
	package = "apache2"
end

#install apache package
package 'apache2' do
	package_name package
	action :install
end

#start and enable apache service
service 'apache2' do
	service_name 'httpd'
	action [:start, :enable]
end

