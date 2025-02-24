# frozen_string_literal: true

# https://refactoring.guru/ja/design-patterns/factory-method/ruby/example

class Creator
  def factory_method
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def some_operation
    product = factory_method

    "Creator: The same creator's code has just worked with #{product.operation}"
  end
end

class ConcreteCreator1 < Creator
  def factory_method
    ConcreteProduct1.new
  end
end

class ConcreteCreator2 < Creator
  def factory_method
    ConcreteProduct2.new
  end
end

class Product
  def operation
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ConcreteProduct1 < Product
  def operation
    '{Result of the ConcreteProduct1}'
  end
end

class ConcreteProduct2 < Product
  def operation
    '{Result of the ConcreteProduct2}'
  end
end

def client_code(creator)
  print "Client: I'm not aware of the creator's class, but it still works.\n"\
        "#{creator.some_operation}"
end

puts 'App: Launched with the ConcreteCreator1.'
client_code(ConcreteCreator1.new)
puts "\n\n"

puts 'App: Launched with the ConcreteCreator2.'
client_code(ConcreteCreator2.new)
