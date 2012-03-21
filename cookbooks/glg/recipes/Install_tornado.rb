ruby_block "install_tornado" do
block do
  Chef::Log.info("INSTALLING TORNADO")
  system "sudo apt-get install python-tornado -y"
end
end

