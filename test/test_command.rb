require 'helper'
  
class Yodaism::Command
    def self.capture_output
      @output = ''
    end

    def self.captured_output
      @output
    end

    def self.output(s)
      @output << s
    end
end

class TestCommand < Test::Unit::TestCase

  def command(cmd)
    cmd = cmd.split(' ') if cmd
    Yodaism::Command.capture_output
    Yodaism::Command.execute(*cmd)
    output = Yodaism::Command.captured_output
    output.gsub(/\e\[\d\d?m/, '')
  end

  def test_version_switch
    assert_match /#{Yodaism::VERSION}/, command('version')
  end
  
  def test_help_switch
    assert_match 'yodaism: help', command('help')
  end
  
  def test_ascii_swtich
    assert_match "::::::-:.`'..`'.:-::::::", command('ascii')
  end
end
