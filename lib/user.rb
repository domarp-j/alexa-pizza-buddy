require 'data_mapper'
require 'net/http'
require 'uri'

require_relative './pizza'

class User
  include DataMapper::Resource

  AMAZON_API_URL = "https://api.amazon.com/user/profile"

  property :id, Serial
  property :name, String
  property :access_token, Text

  has n, :pizzas

  def self.authenticate(access_token, client = Net::HTTP)
    uri = URI.parse("#{AMAZON_API_URL}?access_token=#{access_token}")
    first_name = JSON.parse(client.get(uri))['name'].split(' ').first

    first_or_create(name: first_name, access_token: access_token)
  end
end