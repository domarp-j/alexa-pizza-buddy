require 'sinatra'
require 'sinatra/config_file'
require 'ralyxa'

config_file './config.yml'

load './database.rb'

post '/' do
  Ralyxa::Skill.handle(request)
end