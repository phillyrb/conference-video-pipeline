require 'bundler'
Bundler.require
require './helpers'

desc "Build all files"
task build: destination_files

task default: :build

source_files.each do |source_file|
  destination_file = destination_file_name(source_file)
  title_file = title_file_name(source_file)

  file title_file => [source_file] do
    build_title source_file, title_file
  end

  file destination_file => [source_file, title_file] do
    build_final destination_file, title_file, source_file
  end
end

def build_title(source_file, title_file)
  setup_title_images

  ffmpeg title_file, {
    '-r' => '1/3',
    '-pattern_type' => '"glob"',
    '-i' => 'assets/temp/*.jpg',
    # '-i' => File.join(temp_dir, '*.jpg'),
    '-c:v' => 'libx264',
    '-r' => 30
  }
end

def build_final(destination_file, title_file, source_file)
  ffmpeg File.join(temp_dir, "title.ts"), {
    '-i' => title_file.inspect,
    '-c' => 'copy',
    '-bsf:v' => 'h264_mp4toannexb',
    '-f' => 'mpegts'
  }

  ffmpeg File.join(temp_dir, "source.ts"), {
    '-i' => source_file.inspect,
    '-c' => 'copy',
    '-bsf:v' => 'h264_mp4toannexb',
    '-f' => 'mpegts'
  }

  ffmpeg destination_file, {
    '-i' => '"concat:title.ts|source.ts"',
    '-bsf:a' => 'aac_adtstoasc'
  }
end

def setup_title_images
  p :setup_title_images
end

def ffmpeg(destination_file, options)
  options_string = options.to_a.flatten.push(destination_file).join(' ')

  `ffmpeg #{options_string}`
end
