require 'fileutils'

class DirectoryCreator

  STANDARD_DIRS = ['test', 'lib']
  
  def initialize(root_dir)
    @root_dir = root_dir
  end

  def create_directories
    create_directory_named @root_dir
    FileUtils.cd(@root_dir) do
      STANDARD_DIRS.each { |dir| create_directory_named dir }
    end
  end

  def create_directory_named dir
    begin
      FileUtils.mkdir dir
    rescue Errno::EEXIST
      puts "A directory with this name already exists!  Exiting..."
    end
  end

end
