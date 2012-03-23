# Cookbook Name:: trendsetter
# Recipe:: deploy_trendsetter_services
# Copyright 2011, GLG
# All rights reserved - Do Not Redistribute

trendsetter_root =  node.attribute["trendsetter_root"]

ruby_block "deploy_tornado_trendsetter_framework_logging" do
  block do
    Chef::Log.info("******************")
    Chef::Log.info("DEPLOY TORNADO TRENDSETTER FRAMEWORK")
    Chef::Log.info("******************")
  end
end

ruby_block "stop_trendsetter_service" do
  block do
    Chef::Log.info("STOP TRENDSETTER SERVICE")
    system "sudo kill `ps ax | grep trendsetter\.py | grep -v grep | awk '{print $1}'`"
  end
end

ruby_block "start_trendsetter_service" do
  block do
    Chef::Log.info("START TRENDSETTER SERVICE")
    system "/usr/bin/python #{trendsetter_root}/ts-services/trendsetter.py &"
  end
end

