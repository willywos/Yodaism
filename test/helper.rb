
require 'test/unit'

begin
	require 'rubygems'
	require 'redgreen'
rescue LoadError
end

require 'mocha' 

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'yodaism'
