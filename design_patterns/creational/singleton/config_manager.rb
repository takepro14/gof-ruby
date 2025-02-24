# frozen_string_literal: true

class ConfigManager
  def initialize
    @settings = {}
  end

  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def set(key, value)
    @settings[key] = value
  end

  def get(key)
    @settings[key]
  end
end

#----------
# Client
#----------
config1 = ConfigManager.instance

# 設定値を追加・変更
config1.set(:app_name, "MyApp")
config1.set(:version, "1.0.0")

# 設定値の取得
puts config1.get(:app_name) # => "MyApp"
puts config1.get(:version)  # => "1.0.0"

# 別の場所で `ConfigManager` を取得
config2 = ConfigManager.instance

# config2 からも設定値が取得できる（同じインスタンスであることを確認）
puts config2.get(:app_name) # => "MyApp"

# 設定を更新
config2.set(:app_name, "NewApp")

# config1 からも新しい値が取得できる（同じインスタンスで共有されている）
puts config1.get(:app_name) # => "NewApp"
