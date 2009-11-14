require 'test/unit'
require 'lib/hack_r'
require 'rubygems'
require 'mocha'

class HackRTest < Test::Unit::TestCase
  include HackR

  def test_puts_intro_message
    self.expects(:puts).with("Hacking together a Ruby work environment...")
    output_intro_message
  end

end
