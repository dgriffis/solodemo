# Cookbook Name:: trendsetter
# Recipe:: deploy_trendsetter_solr
# Copyright 2011, GLG
# All rights reserved - Do Not Redistribute

trendsetter_root =  node.attribute["trendsetter_root"]

ruby_block "Deploy TrendSetter Solr" do
  block do
    Chef::Log.info("******************")
    Chef::Log.info("DEPLOY TRENDSETTER SOLR")
    Chef::Log.info("******************")
  end
end

template  "#{trendsetter_root}/solr.xml" do
  source "solr.xml.erb"
end



