trendsetter_root =  node.attribute["trendsetter_root"]

ruby_block "Run Search Logging" do
  block do
    Chef::Log.info("******************")
    Chef::Log.info("RUN SEARCH")
    Chef::Log.info("******************")
  end
end


ruby_block "run_search" do
  block do
    system 'bash #{trendsetter_root}/deploy/start.sh'
    system 'echo "done"'
  end
end