def load_current_resource
  current = PermissionsCache.groups[@new_resource.name]
  if(current)
    @current_resource = Chef::Resource::MinecraftGroup.new(@new_resource.name)
    @current_resource.permissions(PermissionsCache.groups[@new_resource.name]['permissions'] || {})
    @current_resource.inheritance(PermissionsCache.groups[@new_resource.name]['inheritance'] || [])
    Chef::Log.info("Group #{@new_resource.name} exists")
  else
    Chef::Log.info("Group #{@new_resource.name} does not exist")
  end
  @current_resource
end


action :create do
  ruby_block "create group" do
    block do
      PermissionsCache.groups[new_resource.name] = {'permissions' => new_resource.permissions, 'inheritance' => new_resource.inheritance}
      Chef::Log.info "Created new group #{new_resource.name}"
    end
    notifies :create, resources(:ruby_block => 'update_permissions_file')
  end
end

action :create_if_missing do
  ruby_block "ceate group if missing" do
    block do
      PermissionsCache.groups[new_resource.name] = {'permissions' => new_resource.permissions, 'inheritance' => new_resource.inheritance}
      Chef::Log.info "Created new group #{new_resource.name}"
    end

    not_if { current_resource }

    notifies :create, resources(:ruby_block => 'update_permissions_file')
  end
end
