# frozen_string_literal: true

#----------
# Factory
#----------

class FurnitureFactory
  def get_use
    create_chair.use
    create_coffee_table.use
    create_sofa.use
  end

  def create_chair
    raise NotImplementedError, '椅子を作るメソッドが実装されていません。'
  end

  def create_coffee_table
    raise NotImplementedError, 'テーブルを作るメソッドが実装されていません。'
  end

  def create_sofa
    raise NotImplementedError, 'ソファを作るメソッドが実装されていません。'
  end
end

class VictorianFurnitureFactory < FurnitureFactory
  def create_chair
    VictorianChair.new
  end

  def create_coffee_table
    VictorianCoffeeTable.new
  end

  def create_sofa
    VictorianSofa.new
  end
end

class ModernFurnitureFactory < FurnitureFactory
  def create_chair
    ModernChair.new
  end

  def create_coffee_table
    ModernCoffeeTable.new
  end

  def create_sofa
    ModernSofa.new
  end
end

#----------
# Product
#----------

class Furniture
  def use
    raise NotImplementedError, 'useメソッドが実装されていません。'
  end
end

class Chair < Furniture; end
class CoffeeTable < Furniture; end
class Sofa < Furniture; end

class VictorianChair < Chair
  def use
    puts 'ビクトリアンチェアーの座り心地は良いなー！'
  end
end

class VictorianCoffeeTable < CoffeeTable
  def use
    puts 'ビクトリアンテーブルでコーヒーを飲もう！'
  end
end

class VictorianSofa < Sofa
  def use
    puts 'ビクトリアンソファで本を読もう！'
  end
end

class ModernChair < Chair
  def use
    puts 'モダンチェアーの座り心地は良いなー！'
  end
end

class ModernCoffeeTable < CoffeeTable
  def use
    puts 'モダンテーブルでコーヒーを飲もう！'
  end
end

class ModernSofa < Sofa
  def use
    puts 'モダンソファで本を読もう！'
  end
end


#----------
# Client
#----------

VictorianFurnitureFactory.new.get_use
ModernFurnitureFactory.new.get_use

