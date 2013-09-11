require 'tmpdir'

def destination_files
  @destination_files ||= source_files.map { |source_file|
    destination_file_name(source_file)
  }
end

def destination_file_name(source_file)
  File.join(final_dir, File.basename(source_file))
end

def source_files
  @source_files ||= Dir[File.join(source_dir, '*')]
end

def title_file_name(source_file)
  File.join(temp_dir, File.basename(source_file))
end

def final_dir
  "final"
end

def source_dir
  "source"
end

def temp_dir
  @temp_dir ||= Dir.mktmpdir
end
