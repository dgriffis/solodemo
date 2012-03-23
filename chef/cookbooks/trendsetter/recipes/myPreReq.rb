

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

#create the trendsetter directory
dir = node.attribute["trendsetter_root"]
directory "#{dir}" do
    action :create
    recursive true
    not_if {File.exist?("#dir}")}
end

#untar our tarballs
cookbook_file "#{dir}/ts-solr.tgz" do
   source "ts-solr.tgz"
 end

ruby_block "untar_solr" do
block do
  system "tar xvf #{dir}/ts-solr.tgz -C #{dir}"
end
end

#untar our tarballs
cookbook_file "#{dir}/ts-services.tgz" do
   source "ts-services.tgz"
 end

ruby_block "untar_services" do
block do
  system "tar xvf #{dir}/ts-services.tgz -C #{dir}"
end
end

#untar our tarballs
cookbook_file "#{dir}/ts-web.tgz" do
   source "ts-web.tgz"
 end

ruby_block "untar_web" do
block do
  system "tar xvf #{dir}/ts-web.tgz -C #{dir}"
end
end

