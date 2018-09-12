app = search("aws_opsworks_app").first
repo = app['app_source']

ssh_path = '~/.ssh/id_rsa'

file ssh_path do
  owner 'ec2-user'
  mode '0755'
  content repo['ssh_key']
end

git 'Install Repository' do
  repository repo['url']
  revision repo['revision']
  ssh_wrapper "ssh -i #{ssh_path}"
  action :sync
end
