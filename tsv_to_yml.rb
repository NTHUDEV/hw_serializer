# read file
require 'YAML'

def prep_for_yaml(filename)
  data_arr = []
  File.open(filename, 'r') do |file|
    row_counter = 0
    while line = file.gets
      if row_counter == 0
        header_arr = line.chomp("\n").split("\t")
      else
        row_info = line.chomp("\n").split("\t")
      end
      data_arr << (header_arr.zip(row_info)).to_h unless row_counter == 0
      row_counter += 1
    end
  end
  data_arr
end

begin
  if ARGV.count < 2
    puts prep_for_yaml(ARGV[0]).to_yaml
  else
    File.open(ARGV[1], 'w') { |file| file.puts prep_for_yaml(ARGV[0]).to_yaml }
  end
rescue => e
  puts "I'm all out of love: #{e}."
end
