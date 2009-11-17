require File.dirname(__FILE__) + '/test_helper'
require 'lib/directory_creator'
require 'lib/hack_r'

class DirectoryCreatorTest < Test::Unit::TestCase
  include HackR

  def setup
    @root_hack_dir = 'new_project'
    @creator = DirectoryCreator.new(@root_hack_dir)
  end
    
  def test_create_dir
    dir_name = "my_dir"
    FileUtils.expects(:mkdir).with(dir_name)
    @creator.create_directory_named dir_name
  end

  def test_create_directories
    @creator.expects(:create_directory_named).with(@root_hack_dir)
    FileUtils.expects(:cd).yields(nil)
    @creator.expects(:create_directory_named).with('test')
    @creator.expects(:create_directory_named).with('lib')
    @creator.create_directories
  end

  def test_create_directory_named_when_dir_exists
    @creator.stubs(:puts)
    FileUtils.expects(:mkdir).with(@root_hack_dir).twice
    assert_nothing_raised do
      2.times { @creator.create_directory_named @root_hack_dir }
    end
  end
  
end
