require 'json'

puts "Hallo Welt!"

data = JSON.load_file!('data.json')

puts "1. Average calories for food purchased:"
array = []
data.each do |entry|
  array << entry["calories"] if entry["procedence"] == "purchased"
end
puts (array.sum(0.0) / array.size).round(2)
puts "====================================="

puts "2. Favorite foods under 400 calories:"
array = []
data.each do |entry|
  array << entry["name"] if entry["favorite"] == "true" && entry["calories"].to_i < 400 
end
puts array
puts "====================================="

puts "3. Days with calorie consumption over 1000"
array = []
h = {}
data.each do |entry|
  h[entry["date_consumed"]] = h[entry["date_consumed"]].nil? ? entry["calories"].to_i : h[entry["date_consumed"]] + entry["calories"].to_i
end
h.each do |date, total|
  array << date if total > 1000
end
puts array.sort
puts "====================================="

# Parametrize date
puts "4. Total expenditure between Nov 30th and Dec 2nd"
total = 0
data.each do |entry|
  total += entry["price"] if entry["date_consumed"] >= "2022-11-30" and entry["date_consumed"] <= "2022-12-02"
end
puts total.round(2)
puts "====================================="

# Parametrize date
puts "7. All snacks consumed on Nov 29th:"
array = []
data.each do |entry|
  array << entry["name"] if entry["type"] == "snack" && entry["date_consumed"] == "2022-11-29"
end
puts array
puts "====================================="

puts "8. Food items over $25"
array = []
data.each do |entry|
  array << entry["name"] if entry["price"].to_i < 25
end
puts array
puts "====================================="