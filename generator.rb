require 'fileutils'

def create_diretory(dir_name)
  FileUtils::mkdir_p dir_name.gsub(/\s+/, "")
end

def read_file(file)
  File.read(file)
end

def convert_to_array(file)
  file.split(",")
end

def create_and_write_file(file_name, strings = nil)
  File.open(ARGV[0] + file_name, "w") do |f|
    strings.each {|string| f.write(string)} unless strings.nil?
  end
end

BASE_DIRS = convert_to_array(read_file('generate_sinatra_app/base/dir'))

BASE_DIRS.each do |base_dir|
  create_diretory ARGV[0] + '/' + base_dir
end

create_and_write_file('/controllers/init.rb')
create_and_write_file('/models/init.rb')
create_and_write_file('/public/stylesheet/main.scss')
create_and_write_file('/public/javascript/main.js')
create_and_write_file('/views/layout.erb', [read_file('generate_sinatra_app/base/layout')])
create_and_write_file('/Gemfile', convert_to_array(read_file('generate_sinatra_app/base/gemfile')))
create_and_write_file('/app.rb', convert_to_array(read_file('generate_sinatra_app/base/app')))
create_and_write_file('/.ruby-version', ['2.5.1'])
