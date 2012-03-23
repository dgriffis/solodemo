ruby_block "install_mongodb" do
block do
  Chef::Log.info("INSTALLING MONGODB")
  system "sudo apt-get install mongodb -y"
end
end


ruby_block "restart_mongodb" do
block do
  Chef::Log.info("RESTART MONGODB SERVER")
  system "sudo /etc/init.d/mongodb restart"
end
end


