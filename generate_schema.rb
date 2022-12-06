require 'faker'

puts "Hallo Welt!"

string = "["
quantity = 100

quantity.times do |i|
  string += 
"""
  {
    \"id\": #{i+1},
    \"user_id\": \"#{Faker::Number.within(range: 1.00..20.00).round(0)}\",
    \"age\": \"#{Faker::Number.within(range: 18.00..65.00).round(0)}\",
    \"user_weight\": \"#{Faker::Number.within(range: 50.00..120.00).round(2)}\",
    \"name\": \"#{Faker::Food.dish}\",
    \"price\": #{Faker::Number.within(range: 5.00..50.00).round(2)},
    \"weight\": #{Faker::Number.within(range: 100..1000)},
    \"calories\": #{Faker::Number.within(range: 100..600)},
    \"fat\": #{Faker::Number.within(range: 5.00..20.00).round(2)},
    \"carbs\": #{Faker::Number.within(range: 5.00..20.00).round(2)},
    \"protein\": #{Faker::Number.within(range: 5.00..20.00).round(2)},
    \"time_consumed\": \"#{Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).strftime("%H:%M")}\",
    \"date_consumed\": \"#{Faker::Date.backward(days: 7)}\",
    \"type\": \"#{["breakfast", "lunch", "dinner", "snack"].sample}\",
    \"favorite\": \"#{rand(8)%4 == 0}\",
    \"procedence\": \"#{["homemade", "purchased"].sample}\"
  }
"""
  string += "," unless i+1 == quantity
end
string += "]"

File.write('data.json', string)