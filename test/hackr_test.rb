require File.dirname(__FILE__) + '/test_helper'
require 'lib/hack_r'

class HackRTest < Test::Unit::TestCase
  include HackR

  def setup
    @root_hack_dir = "hacker_playground"
  end

  def test_puts_intro_message
    self.expects(:puts).with("Hacking together a Ruby work environment...")
    output_intro_message
  end

  def test_hack_executes_commands
    command_line_args = [@root_hack_dir]
    self.expects :output_intro_message
    self.expects(:create_directories).with(@root_hack_dir)
    hack command_line_args
  end

  def test_hack_does_not_execute_without_args
    self.expects :output_help_message
    hack []
  end

end
