require './lib/pizza'
require 'active_support/core_ext/array/conversions'

intent "StartPizzaOrder" do
  ask("Great! What pizza would you like? You can pick from #{Pizza::SIZES.to_sentence}")
end