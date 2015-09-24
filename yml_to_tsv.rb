#read file
require "YAML"

def prep_for_tsv(filename,output)
  line =''
  yaml_data = YAML::load(File.read(filename))
  header_arr = yaml_data[0].keys
  columns = header_arr.map {|sym| sym.to_s}.join("\t")
  File.write(output,columns + "\n",mode: 'a')

  yaml_data.each do |hash|
    header_arr.each do |field|
      line += hash[field].to_s+"\t"
    end
    File.write(output,line + "\n", mode: 'a')
    line = ''
  end

end

begin
  if ARGV.count < 2
    puts "Usage: ruby yml_to_tsv.rb input_file.yml output_file.tsv"
  else
    prep_for_tsv(ARGV[0],ARGV[1])
  end
rescue => e
  puts "I'm all out of love: #{e}."
end
