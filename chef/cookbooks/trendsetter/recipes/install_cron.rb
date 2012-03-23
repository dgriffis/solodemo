# Cookbook Name:: trendsetter
# Recipe:: install_cron
# Copyright 2011, GLG
# All rights reserved - Do Not Redistribute

trendsetter_root =  node.attribute["trendsetter_root"]

ruby_block "create_log_dir" do
  block do
    Chef::Log.info("CREATING LOGGING DIRECTORY")
    system "sudo mkdir -p #{trendsetter_root}/logs"
    Chef::Log.info("LOGGING DIRECTORY CREATED")
  end
end

#http://wiki.opscode.com/display/chef/Resources#Resources-Cron
cron "populate_cm_resume_csv" do
  minute "*/2"
  command "python #{trendsetter_root}/ts-services/scripts/cm_resumes_to_csv.py -cm_resumes_path_file_name='#{trendsetter_root}/data/cm_resumes.csv' -log_to_file='#{trendsetter_root}/logs/cm_resumes_to_csv.log'"
end