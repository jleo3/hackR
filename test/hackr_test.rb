require 'test/unit'
require 'lib/hack_r'
require 'rubygems'
require 'mocha'

class HackRTest < Test::Unit::TestCase
  include HackR

  def setup
    @root_hack_dir = "hacker_playground"
  end

  def test_puts_intro_message
    self.expects(:puts).with("Hacking together a Ruby work environment...")
    output_intro_message
  end

  def test_create_root_dir
    FileUtils.expects(:mkdir).with(@root_hack_dir)
    create_root_dir_named @root_hack_dir
  end

  def test_create_subdirs
    FileUtils.expects(:mkdir).with("lib")
    FileUtils.expects(:mkdir).with("test")
    create_subdirs
  end

  def test_hack_executes_commands
    command_line_args = [@root_hack_dir]
    self.expects :output_intro_message
    self.expects(:create_root_dir_named).with(@root_hack_dir)
    self.expects :create_subdirs
    hack command_line_args
  end

end
