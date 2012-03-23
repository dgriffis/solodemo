# Cookbook Name:: trendsetter
# Recipe:: deploy_trendsetter_web
# Copyright 2011, GLG
# All rights reserved - Do Not Redistribute

trendsetter_root =  node.attribute["trendsetter_root"]

ruby_block "stop_nginx" do
  block do
    Chef::Log.info("START NGINX")
    system "sudo /etc/init.d/nginx stop"
  end
end


ruby_block "delete_web_resource_directories" do
  block do
    Chef::Log.info("DELETE WEB RESOURCE DIRECTORIES")
    system "sudo rm -rf /var/www/"
    Chef::Log.info("DELETED /var/www/")
  end
end


ruby_block "create_web_resource_directories" do
  block do
    Chef::Log.info("CREATING WEB RESOURCE DIRECTORIES")
    system "sudo mkdir /var/www/"
    system "sudo mkdir /var/www/js"
    system "sudo mkdir /var/www/css"
    Chef::Log.info("WEB RESOURCE DIRECTORIES CREATED")
  end
end

ruby_block "move_web_docs" do
  block do
    Chef::Log.info("MOVING WEB PAGES")  
    system "sudo cp -r #{trendsetter_root}/ts-web/html/* /var/www/"
    system "sudo cp -r #{trendsetter_root}/ts-web/js/* /var/www/js"
    system "sudo cp -r #{trendsetter_root}/ts-web/css/* /var/www/css"
    Chef::Log.info("WEB PAGES MOVED")  
  end
end

ruby_block "change_web_permissions" do
  block do
    Chef::Log.info("MAKING www-data owner /var/www")  
    system "sudo chown -R www-data /var/www"
  end
end

ruby_block "start_nginx" do
  block do
    Chef::Log.info("START NGINX")
    system "sudo /etc/init.d/nginx restart"
  end
end
