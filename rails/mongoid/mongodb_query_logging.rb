# Rails.root/config/initializer/mongoid.rb
Mongoid.configure do |config|
  host = 'your host'
  port = 27017 # by default 
  dbname = 'your dbname'
  db_user_name = 'your db user name'
  db_password = 'your db password'
  config.master = Mongo::Connection.new(host, port, :logger => Rails.logger).db(dbname)
  # authenticate 필요하면 적용
  config.master.authenticate(db_user_name, db_password)
end
