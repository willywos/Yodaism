Yodaism
============
    
### Desc

Ever need a quick quote from Yoda? Maybe you just need him to give you some quick advice. 
Yodaism is a collection of quotes and some ascii porn to get your Yoda fix.

### Requirements

Ruby >= 1.9.2

### Install

`gem install yodaism`


### How-to

There is really only two modes right now for it.

To get just a plain quote just execute the gem with no options

```bash
[~/yoda]$ yodaism
..........
```

To get a picture of yoda in ascii format

```bash
[~/yoda]$ yodaism ascii
..........
```


![picture alt](http://i.imgur.com/5hBdY.png "Yodaism")


That's all there is, very simple.


### Use it in your script

```ruby
require 'yodaism'

class YodaQuote
    include Yodaism

    attr_accessor :yoda_quote

    def initialize
      @yoda_quote = Yodaism.quote
    end

    def random
      @yoda_quote.random
    end

    def ascii 
      @yoda_quote.ascii
    end
end

example = YodaQuote.new
puts example.ascii
puts example.random
```





