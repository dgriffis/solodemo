

python_pip "pyyaml" do
  action :install
end

python_pip "pika" do
  version "0.9.5"
  action :install
end

python_pip "solrpy" do
  action :install
end

python_pip "pymongo" do
  action :install
end

python_pip "cython" do
  action :install
end

python_pip "pymssql" do
  action :install
end

python_pip "tornado" do
  version "2.2"
  action :install
end

ruby_block "stop_apache" do
block do
  Chef::Log.info("STOP APACHE")
  system "sudo /etc/init.d/apache2 stop"
end
end

ruby_block "remove_apache" do
block do
  Chef::Log.info("REMOVE APACHE")
  system "sudo apt-get autoremove apache2 -y"
end
end