git "#{Chef::Config[:file_cache_path]/app_name}" do
  repository node[:app_name][:git_repository]
  revision node[:app_name][:git_revision]
  action :sync
end
