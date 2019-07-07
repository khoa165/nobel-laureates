require 'rubygems'
require 'json'

json = File.read('laureate.json')
obj = JSON.parse(json) # obj is a Hash object.

# obj.size => 1

data_array = obj['laureates'] # get the only value.

# create a file to write data into.
file = File.open('nobel_laureates.txt', 'w')

# data_array is an array of info related to each laureate.
data_array.each do |info|
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  year_born = info['born'].start_with?('0000') ? 'N/A' : info['born']
  year_died = info['died'].start_with?('0000') ? 'N/A' : info['died']
  # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ####################################
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  all_prizes = ''
  # list_prizes is a array of hashes.
  list_prizes = info['prizes']
  # prize is a hash.
  list_prizes.each do |prize|
    all_prizes += " in #{prize['category']} (#{prize['year']}),"
  end
  # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  ####################################
  # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  all_prizes = all_prizes.chomp(',')
  display_string = "#{info['firstname']}, #{info['surname']}"
  display_string += " (#{year_born} - #{year_died})"
  display_string += " from #{info['bornCountry']} won a Nobel prize"
  display_string += "#{all_prizes}."
  file.puts display_string
  # <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
end
