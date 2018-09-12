# Install repo dependencies
script "Install repo dependencies" do
  interpreter "bash"
  code <<-EOH
    cd /git-repository
    npm install
    npm build
    npm start
  EOH
end
