#databag = data_bag('mysql')
passwords=data_bag_item('mysql','passwords')

#secret = Chef::Config[:encrypted_data_bag_secret]
#Chef::Log.info("The encrypted password file is: #{secret}")
#passwords=Chef::EncryptedDataBagItem.load('mysql','password', secret)
#Chef::Log.info("The unencrypted password is: #{passwords["admin"]}")

ruby_block "install_mysql_server" do
block do
  Chef::Log.info("INSTALL MYSQL SERVER")
  system "echo mysql-server mysql-server/root_password password #{passwords["admin"]} | sudo debconf-set-selections"
  system "echo mysql-server mysql-server/root_password_again password #{passwords["admin"]} | sudo debconf-set-selections"
  system "sudo apt-get install mysql-server -y"
end
end

ruby_block "restart_mysql_server" do
block do
  Chef::Log.info("RESTART MYSQL SERVER")
  system "sudo /etc/init.d/mysql restart"
end
end


ruby_block "install_python-mysql" do
block do
  Chef::Log.info("INSTALL PYTHON-MYSQL")
  system "sudo apt-get install python-mysqldb python-mysqldb-dbg -y"
end
end


#ruby_block "create_mysql_database_and_table" do
#block do
#  Chef::Log.info("CREATE MYSQL DATABASE AND TABLE")
#  system "mysql -u root --password=#{passwords["admin"]} < /home/ubuntu/trendsetter/services/sql/create_db_and_table.sql"
#end
#end