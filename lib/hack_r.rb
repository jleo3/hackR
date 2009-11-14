module HackR

  def hack(args)
    output_intro_message
    create_root_dir_named args.first
    create_subdirs
  end

  def output_intro_message
    puts "Hacking together a Ruby work environment..."
  end

  def create_root_dir_named dir_name
    FileUtils.mkdir dir_name 
  end

  def create_subdirs
    FileUtils.mkdir 'lib'
    FileUtils.mkdir 'test'
  end
      

end
