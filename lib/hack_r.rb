require File.dirname(__FILE__) + "/directory_creator"

module HackR
  class DirectoryExistsError < Exception; end

  def hack(args)
    if args.empty?
      output_help_message
      return
    end
    output_intro_message
    create_directories args.first
  end

  def create_directories(root_dir)
    @directory_creator = DirectoryCreator.new(root_dir)
    @directory_creator.create_directories
  end

  def output_intro_message
    puts "Hacking together a Ruby work environment..."
  end

  def output_help_message
    puts %{You must supply the name of the project:

             'hackr project_name'
          }
  end

end
