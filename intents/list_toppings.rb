require './lib/pizza'
require 'active_support/core_ext/array/conversions'

intent 'ListToppings' do
  toppings = Pizza::TOPPINGS.map { |topping| topping.to_s.gsub('_', ' ') }.to_sentence

  ask("The available toppings are #{toppings}")
end