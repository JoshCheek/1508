class Pizza
  DEEP_DISH = :deep_dish
  SMALL     = :small
  ROUND     = :round

  def initialize(toppings, style, size, shape, num_slices, cost)
    @num_slices = num_slices
  end

  def num_slices=(num_slices)
    @num_slices = num_slices
  end

  def num_slices
    @num_slices
  end

  def eat
    self.num_slices -= 1
    :lol
  end
end

cost        = 3
num_slices  = 8
shape       = Pizza::ROUND
size        = Pizza::SMALL
style       = Pizza::DEEP_DISH
toppings    = ['pepperoni', 'cheese', 'pineapple', 'sausage']
joshs_pizza = Pizza.new(toppings, style, size, shape, num_slices, cost)

joshs_pizza.num_slices # => 8
joshs_pizza.eat        # => :lol
joshs_pizza.num_slices # => 7
