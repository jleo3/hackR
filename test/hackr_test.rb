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

  def test_create_dir
    dir_name = "my_dir"
    FileUtils.expects(:mkdir).with(dir_name)
    create_directory_named dir_name
  end

  def test_create_directories
    self.expects(:create_directory_named).with(@root_hack_dir)
    self.expects(:create_directory_named).with('test')
    self.expects(:create_directory_named).with('lib')
    create_directories @root_hack_dir
  end

  def test_hack_executes_commands
    command_line_args = [@root_hack_dir]
    self.expects :output_intro_message
    self.expects(:create_directories).with(@root_hack_dir)
    hack command_line_args
  end

end
