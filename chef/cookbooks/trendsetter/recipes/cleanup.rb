# Cookbook Name:: trendsetter
# Recipe:: cleanup
# Copyright 2011, GLG
# All rights reserved - Do Not Redistribute

trendsetter_root =  node.attribute["trendsetter_root"]
solr_user =  node.attribute["solr_user"]

# remove files
ruby_block "cleanup" do
  block do
    Chef::Log.info("CLEANUP")
    system "sudo rm -f #{trendsetter_root}/*.tgz"
    system "sudo rm -rf #{trendsetter_root}/._*"
    system "sudo rm -rf #{trendsetter_root}/chef-deployables"
    system "sudo chown -R #{solr_user}:#{solr_user} #{trendsetter_root}"
  end
end

ruby_block "restart_mongodb" do
  block do
    Chef::Log.info("RESTART MONGODB SERVER")
    system "sudo /etc/init.d/mongodb restart"
  end
end

ruby_block "restart_nginx" do
  block do
    Chef::Log.info("START NGINX")
    system "sudo /etc/init.d/nginx restart"
  end
end
