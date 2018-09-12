app = search("aws_opsworks_app").first
repo = app['app_source']

ssh_path = '/home/ec2-user/.ssh/id_rsa'
ssh_wrapper_path = '/home/ec2-user/.ssh/ssh_wrapper'

# Write ssh key to ec2 instance
file ssh_path do
  owner 'ec2-user'
  mode '0755'
  content repo['ssh_key']
end

# Create executable ssh wrapper for github
file ssh_wrapper_path do
  owner 'ec2-user'
  mode '0755'
  content "#!/bin/sh\nexec /usr/bin/ssh -i #{ssh_path} -o \"StrictHostKeyChecking=no\" \"$@\""
end
