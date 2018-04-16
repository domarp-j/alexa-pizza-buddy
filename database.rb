require './lib/pizza'

dbuser = settings.dbuser
dbpass = settings.dbpass
dbname = settings.dbname

configure :development do
  DataMapper.setup(:default, "postgres://#{dbuser}:#{dbpass}@localhost/#{dbname}")
end

DataMapper.finalize
Pizza.auto_upgrade!