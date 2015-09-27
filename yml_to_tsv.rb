# read file
require 'YAML'

def prep_for_tsv(filename, output)
  yaml_data = YAML::load(File.read(filename))
  File.write(output, yaml_data[0].keys.join("\t") + "\n", mode: 'a')
  yaml_data.each do |hash|
    File.write(output, hash.values.join("\t") + "\n", mode: 'a')
  end
end

begin
  if ARGV.count < 2
    puts 'Usage: ruby yml_to_tsv.rb input_file.yml output_file.tsv'
  else
    prep_for_tsv(ARGV[0], ARGV[1])
  end
rescue => e
  puts "I'm all out of love: #{e}."
end
