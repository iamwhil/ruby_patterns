# Decorator pattern enforces the idea of making things extensible but immutable.
# Favoring extending class functionality instead of changing the base class.

class Beverage
  attr_accessor :description, :cost

  def initialize()
  end

  def get_description
    return description
  end

  def get_cost
    return cost
  end
end

class BeverageDecorator < Beverage

  attr_accessor :beverage

  def initialize(beverage)
    @beverage = beverage
  end

  def get_description
    if beverage
      "#{beverage.get_description}, #{self.description}"
    else
      self.description
    end
  end 

  def get_cost
    if beverage 
      self.cost + beverage.get_cost
    else
      self.cost
    end
  end

  def explode
    puts "pop"
  end
end

class CokeBeverage < Beverage
  def initialize
    @description = "CocaCola"
    @cost = 1.20
  end
end

class TidePodeBeverage < Beverage 
  def initialize
    @description = "Delicious Tide Pod!"
    @cost = 0.80
  end
end

class WhippedBeverageDecorator < BeverageDecorator
  def initialize(beverage)
    super
    @cost = 0.40 
    @description = "Whipped Cream"
  end
end

puts "COKE"
beverage = CokeBeverage.new()
# v This will fail because the base beverage class does not implement 'explode'
# puts beverage.explode 

puts beverage.get_description
puts beverage.get_cost

beverage = WhippedBeverageDecorator.new(beverage)
puts beverage.get_description
puts beverage.get_cost

beverage = WhippedBeverageDecorator.new(beverage)
puts beverage.get_description
puts beverage.get_cost
puts beverage.explode
