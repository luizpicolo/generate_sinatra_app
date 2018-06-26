require 'fileutils'
require_relative 'utils'

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
