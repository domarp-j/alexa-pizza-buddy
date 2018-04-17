require 'data_mapper'
require 'dm-postgres-types'

require_relative './user'

class Pizza
  include DataMapper::Resource

  SIZES = [:large, :medium, :small]
  TOPPINGS = [:mushrooms, :barbecue_sauce, :sausage, :pineapple, :ham, :garlic, :olives, :pepperoni]

  property :id, Serial
  property :size, String
  property :toppings, PgArray

  belongs_to :user

  def self.disallowed_toppings(toppings)
    toppings.reject { |topping| allowed_topping?(topping) }
  end

  private

  def self.allowed_topping?(topping)
    TOPPINGS.include?(topping.gsub(' ', '_').to_sym)
  end
end