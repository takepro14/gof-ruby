# frozen_string_literal: true

# https://refactoring.guru/ja/design-patterns/singleton/ruby/example

class Singleton
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def some_business_logic
  end
end

s1 = Singleton.instance
s2 = Singleton.instance

if s1.equal?(s2)
  print 'Singleton works, both variables contain the same instance.'
else
  print 'Singleton failed, variables contain different instances.'
end
