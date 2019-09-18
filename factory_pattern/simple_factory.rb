# In this example the pizza store is no longer coupled to the pizza types.
# It still needs to know what it can do with a pizza to use it (description)
# but it does not need to know about how to make the pizzas.
# The PizzaStore knows what to do with the pizza.
# The Pizza Factory creates pizzas and returns them to the store..

class PizzaFactory
  # We could have allowed types in here for error checking.
  # We could also avoid a case statement by building the ClassName
  # from the pizza_type and constantizing it.
  def create_pizza(pizza_type)
    puts "factorying up a pizza!"
    pizza = case pizza_type
    when "cheese"
      CheezePizza.new()
    when "carpet" 
      CarpetPizza.new()
    else
      AirPizza.new()
    end
    return pizza
  end
end

# This pizza store knows nothing about how to create a pizza...
# It does know how to use a pizza factory and what a pizza can do.
# It is less coupled to the pizza (especially the creation).
class PizzaStore
  PIZZA_FACTORY = PizzaFactory.new()
  def make_a_pizza(pizza_type)
    puts "Let the factory do the heavy lifting!"
    pizza = PIZZA_FACTORY.create_pizza("cheese")
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
store.make_a_pizza("cheese")