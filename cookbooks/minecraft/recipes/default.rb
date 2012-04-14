#
# Cookbook Name:: minecraft
# Recipe:: default
#
# Copyright 2012, Stuart Caborn
#
# All rights reserved - Do Not Redistribute
#

%w{apt screen java}.each do |rcp| 
  include_recipe(rcp)
end

package 'rsync'

user 'mcsvc' do
  comment   'minecraft service'
end

 
group "minecraft" do
  gid     999
  members 'mcsvc'
end

['/opt/minecraft',
 '/etc/minecraft',
 '/var/minecraft',
 '/var/minecraft/worldstorage',
 '/var/minecraft/worldstorage/world',
 '/var/minecraft/worldstorage/world_nether',
 '/var/minecraft/worldstorage/world_the_end',
 '/var/minecraft/backups',
 '/var/minecraft/backups/worlds',
 '/var/minecraft/backups/server',
 '/var/minecraft/logs',
 '/etc/minecraft/init'].each do |dir|
  directory dir do
    owner 'mcsvc'
    group 'minecraft'
  end
end

#is this really a template?
template "/etc/minecraft/init/minecraft" do
  source "minecraft.erb"
  owner "mcsvc"
  group "minecraft"
  mode "0755"
end

link "/etc/init.d/minecraft" do
  to "/etc/minecraft/init/minecraft"
end

file '/var/minecraft/logs/server.log' do
  owner "mcsvc"
  group "minecraft"
  action :create_if_missing
end

link '/opt/minecraft/server.log' do
 to '/var/minecraft/logs/server.log'
end

%w{world world_nether world_the_end}.each do |world|
  directory "/var/minecraft/worldstorage/#{world}" do
    owner 'mcsvc'
    group 'minecraft'
  end

  link "/opt/minecraft/#{world}" do
    to  "/var/minecraft/worldstorage/#{world}"
  end
end

['banned-ips.txt',
 'banned-players.txt',
 'bukkit.yml',
 'permissions.yml',
 'white-list.txt'].each do |config_file|
  cookbook_file "/etc/minecraft/#{config_file}" do
    mode "0644"
    owner 'mcsvc'
    group 'minecraft'
    action :create
  end

  link "/opt/minecraft/#{config_file}" do
    to  "/etc/minecraft/#{config_file}"
  end
end

[
 'ops.txt',
 'server.properties'].each do |config_file|
  
  template "/etc/minecraft/#{config_file}" do
    mode "0644"
    owner 'mcsvc'
    group 'minecraft'
    variables( :minecraft => node.minecraft )
    action :create
  end
 
  link "/opt/minecraft/#{config_file}" do
    to  "/etc/minecraft/#{config_file}"
  end
end


template "/etc/minecraft/init/config" do
  source "config.erb"
  owner 'mcsvc'
  group 'minecraft'
  variables(
            :service_user => 'mcsvc',
            :minecraft_path => '/opt/minecraft',
            :initial_memory => '400M',
            :max_memory => '1400M',
            :backup_path => '/var/minecraft/backups/worlds',
            :log_path => '/var/minecraft/logs',
            :server_backup => '/var/minecraft/backups/server',
            :world_storage => '/var/minecraft/worldstorage'
  )
end

# TODO - tokenise version
remote_file "/opt/minecraft/craftbukkit_server.jar" do
  source 'http://dl.bukkit.org/downloads/craftbukkit/get/01026_1.2.5-R1.0/craftbukkit.jar'
  mode "0644"
  owner "mcsvc"
  group "minecraft"
  action :create_if_missing
end

service "minecraft" do
  supports :start => true, :restart => true, :status => true, :reload => true
  action [:enable, :start]
  subscribes :restart, resources(:template => "/etc/minecraft/init/config")
  subscribes :restart, resources(:remote_file => "/opt/minecraft/craftbukkit_server.jar")
end


#m  h   dom mon dow command
#02  05  *   *   *   /etc/init.d/minecraft backup
#55  04  *   *   *   /etc/init.d/minecraft log-roll
#*/30    *   *   *   *   /etc/init.d/minecraft to-disk

cron "minecraft-backup" do
  hour "5"
  minute "2"
  command '/etc/init.d/minecraft backup'
end

cron "minecraft-log-roll" do
  hour "4"
  minute "55"
  command '/etc/init.d/minecraft log-roll'
end

cron "minecraft-flush" do
  minute "*/30"
  command '/etc/init.d/minecraft to-disk'
end
