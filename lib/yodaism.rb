begin
    require 'rubygems'
rescue LoadError
end

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require 'yodaism/version'
require 'yodaism/command'
require 'yodaism/config'
require 'yodaism/quote'

module Yodaism
  extend self
  
  def quote
    @quote ||= Yodaism::Quote.new
  end
  
  def config
    @config ||= Yodaism::Config.new
  end
end
