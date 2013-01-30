#
# Cookbook Name:: phpdcd
# Recipe:: default
#
# Copyright 2013, Escape Studios
#

include_recipe "php"

#PHP Extension and Application Repository PEAR channel
php_pear_channel "pear.php.net" do
  action :update
end

#upgrade PEAR
php_pear "PEAR" do
	action :upgrade
end

#PHPUnit PEAR channel
pearhub_chan = php_pear_channel "pear.phpunit.de" do
	action :discover
end

#upgrade phpdcd
php_pear "phpdcd" do
	channel pearhub_chan.channel_name
	if node[:phpdcd][:version] != "latest"
		version "#{node[:phpdcd][:version]}"
	end
	action :upgrade
end