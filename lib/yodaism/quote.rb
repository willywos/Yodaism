module Yodaism
  class Quote
    attr_accessor :quote_array
    attr_accessor :word_limit

    def initialize
      @quotes = Yodaism.config.quotes
      @@quote_array = Array.new
      @@word_limit = 8
    end

    def random
      r = Random.new
      c = r.rand(0..@quotes.size - 1)  
      split_quote_text @quotes[c].strip
    end

    def ascii
      quote_with_yoda random
    end

    def quote_with_yoda(yoda_quote)
        yoda = %q{
                     .--.           
           ::\`--._,'.::.`._.--'/:: 0
           ::::.  ` __::__ '  .:::: 1
           ::::::-:.`'..`'.:-:::::: 2
           ::::::::\ `--' /:::::::: 3
           :::::::::------::::::::: 4
                                    5
                                    6
                                    7
                                    8

        }.gsub(/^ {10}/,'')
        return replace_identifiers_with_quote_text yoda, yoda_quote
    end

    def replace_identifiers_with_quote_text(text, yoda_quote)
      #replaces the number from the template with a quote and
      #also replaces any left over number with a blank string
      #
      index = 0
      (0..8).each do |line_num|
        replace_text = ""
        if index <= yoda_quote.size
          replace_text = yoda_quote[index] == nil ? "" : yoda_quote[index] 
        end
        text = text.gsub(index.to_s, replace_text)
        index += 1
      end
      return text
    end

    def split_quote_text(text)
      text_array = text.split(" ")
      size = text_array.size.divmod(@@word_limit)
      populate_quote_array(text_array, size[0], size[1])
      return @@quote_array
    end

    def populate_quote_array(text_array, lines, remainder)
      limit = 0
      (1..lines).each do | line_num |
        put_text_in_array(text_array[limit, @@word_limit])
        limit = @@word_limit * line_num
      end
      put_text_in_array(text_array[limit, remainder])
    end

    def put_text_in_array(word_array)
      text = ""
      word_array.each do |word|
        text = text.empty? ? word : text + " " + word
      end
      @@quote_array.push(text)
    end
  end
end
