# frozen_string_literal: true

#----------
# Factory
#----------

class LoggerFactory
  def create_logger
    raise NotImplementedError, "#{self.class} に #{__method__} メソッドが実装されていません。"
  end
end

class ConsoleLoggerFactory < LoggerFactory
  def create_logger
    ConsoleLogger.new
  end
end

class FileLoggerFactory < LoggerFactory
  def create_logger
    FileLogger.new
  end
end

#----------
# Logger
#----------

class Logger
  def log
    raise NotImplementedError, "#{self.class} に #{__method__} メソッドが実装されていません。"
  end
end

class ConsoleLogger < Logger
  def log(message)
    puts "[Console] #{message}"
  end
end

class FileLogger < Logger
  def log(message)
    File.open('log.txt', 'a') do |file|
      file.puts("[File] #{message}")
    end
  end
end

#----------
# Client
#----------

# コンソールロガーを作成
console_logger_factory = ConsoleLoggerFactory.new
logger = console_logger_factory.create_logger
logger.log('Hello, Console!')
# => [Console] Hello, Console!

# ファイルロガーを作成
file_logger_factory = FileLoggerFactory.new
logger = file_logger_factory.create_logger
logger.log('Hello, File!')
# => "Hello, File!" が "log.txt" に出力される

