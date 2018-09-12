app = search("aws_opsworks_app").first
repo = app['app_source']

ssh_wrapper_path = '/home/ec2-user/.ssh/ssh_wrapper'

# Clone repo
git 'git-repository' do
  repository repo['url']
  revision repo['revision']
  ssh_wrapper ssh_wrapper_path
  action :sync
end
