class Pizza
  SIZES = [:large, :medium, :small]
  TOPPINGS = [:mushrooms, :barbecue_sauce, :sausage, :pineapple, :ham, :garlic, :olives, :pepperoni]

  def self.disallowed_toppings(toppings)
    toppings.reject { |topping| allowed_topping?(topping) }
  end

  private

  def self.allowed_topping?(topping)
    TOPPINGS.include?(topping.gsub(' ', '_').to_sym)
  end
end