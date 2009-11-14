require 'fileutils'

module HackR
  STANDARD_DIRS = ['test', 'lib']

  def hack(args)
    output_intro_message
    create_directories args.first
  end

  def create_directories root_dir
    create_directory_named root_dir
    FileUtils.cd(root_dir) do
      STANDARD_DIRS.each { |dir| create_directory_named dir }
    end
  end

  def create_directory_named dir
    FileUtils.mkdir dir
  end

  def output_intro_message
    puts "Hacking together a Ruby work environment..."
  end

end
