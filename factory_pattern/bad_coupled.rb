# In this example the pizza store is tightly coupled to the pizza types.
# If we want to add a new pizza we have to make a new case for it and 
# create a new Pizza sub-class.
# The PizzaStore knows all about the pizzas.

class PizzaStore

  def create_pizza(pizza_type)
    puts "creating a coupled pizza!"
    pizza = case pizza_type
    when "cheese"
      CheezePizza.new()
    when "carpet" 
      CarpetPizza.new()
    else
      AirPizza.new()
    end
    puts "Pizza! #{pizza.description}"
  end

end

class Pizza
  def description
    raise NotImplementedError
  end
end

class CheezePizza < Pizza
  def description
    "Tasty Cheese!"
  end
end

class CarpetPizza < Pizza
  def description
    "Nasty Carpet Pizza :("
  end
end

class AirPizza < Pizza
  def description
    "Nothing. You get nothing."
  end
end

store = PizzaStore.new()
store.create_pizza("cheese")