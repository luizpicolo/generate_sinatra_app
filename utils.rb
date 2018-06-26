def create_diretory(dir_name)
  FileUtils::mkdir_p remove_write_space(dir_name) unless File.directory?(dir_name)
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

def remove_write_space(string)
  string.gsub(/\s+/, "")
end
