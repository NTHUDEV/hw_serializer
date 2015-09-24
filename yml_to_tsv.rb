#read file
require "YAML"

def prep_for_tsv()
  line =''
  yaml_data = YAML::load(File.read('test.yml'))
  header_arr = yaml_data[0].keys
  columns = header_arr.map {|sym| sym.to_s}.join("\t")
  File.write('test-2.tsv',columns + "\n",mode: 'a')

  yaml_data.each do |hash|
    header_arr.each do |field|
      line += hash[field].to_s+"\t"
    end
    File.write('test-2.tsv',line + "\n", mode: 'a')
    line = ''
  end

end

 prep_for_tsv
