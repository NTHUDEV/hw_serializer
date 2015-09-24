#read file
require "YAML"

def prep_for_yaml(filename)
  data_arr = []

  File.open(filename,'r') do |file|
    rowcounter = 0
    while line = file.gets #string
      data_hash = {}
      if rowcounter == 0
         header_arr = line.chomp("\n").split("\t")
      else
        row_info = line.chomp("\n").split("\t")
        header_arr.length.times do |i|
        data_hash[header_arr[i].to_sym] = row_info[i]
        end
      end
      data_arr << data_hash unless data_hash.empty?
      data_hash = {}
      rowcounter += 1
    end
  end
data_arr
end

File.open('test.yml','w') do |file| file.puts prep_for_yaml('programmers_survey_2014.tsv').to_yaml end
#puts programmer_arr.to_yaml
#convert to yaml
