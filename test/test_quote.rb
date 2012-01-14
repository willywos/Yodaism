
require 'helper'

class TestQuote < Test::Unit::TestCase

	def test_split
		quote = Yodaism::Quote.new
		textArray = quote.split_quote_text("test should be split on new line when more then 5 words i wonder if it's just the remainder")
			
    assert_equal 'test should be split on new line when', textArray[0]
		assert_equal 'more then 5 words i wonder if it\'s', textArray[1]
		assert_equal 'just the remainder', textArray[2]
  end

  def test_replace_identifiers_with_quote_text
    quote = Yodaism::Quote.new
    textArray = quote.split_quote_text("test should be split on new line when more then 5 words i wonder if it's just the remainder")
    
    indentifier_string = "0 : 1 : 2 : 3"
    replaced_text = quote.replace_identifiers_with_quote_text(indentifier_string, textArray)

    assert_equal 'test should be split on new line when : more then  words i wonder if it\'s : just the remainder : ', replaced_text
  end
end
