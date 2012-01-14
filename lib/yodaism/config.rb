module Yodaism
  class Config
    FILE = "lib/yodaism/quotes/quotes.txt"
    attr_reader :quotes

    def initialize
      @quotes = {}
      File.exists?(file) ? load_quotes_from_file : exit(1)
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
