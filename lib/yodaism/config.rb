module Yodaism
  class Config
    file_path = File.expand_path(File.dirname(__FILE__))
    FILE = "#{file_path}/quotes/quotes.txt"
    
    attr_reader :quotes

    def initialize
      @quotes = {}
      File.exists?(file) ? load_quotes_from_file : file_not_found
    end
    
    def file_not_found
      puts "could not find file in path #{FILE}"
      exit(1)
    end

    def load_quotes_from_file
      f = File.new(file)
      f.each { |line| 
        @quotes[f.lineno-1] = line 
      }
    end
    
    def file
      FILE
    end
  end
end
