require 'faker'

users = []

20.times do |i|
  users << {id: i, age: Faker::Number.within(range: 18.00..65.00).round(0), user_weight: Faker::Number.within(range: 50.00..120.00).round(2)}
end

string = "["
quantity = 6000

quantity.times do |i|
  user = users[Faker::Number.within(range: 0..19).round(0)]
  time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).strftime("%H:%M")
  type = ""
  if ('05:00'..'10:30').to_a.include? time
    type = "breakfast"
  elsif ('11:30'..'14:30').to_a.include? time
    type = "lunch"
  elsif ('17:30'..'20:30').to_a.include? time
    type = "dinner"
  else
    type = "snack"
  end

  string += 
"""
  {
    \"id\": #{i+1},
    \"user_id\": \"#{user[:id]}\",
    \"age\": \"#{user[:age]}\",
    \"user_weight\": \"#{user[:user_weight]}\",
    \"name\": \"#{Faker::Food.dish}\",
    \"price\": #{Faker::Number.within(range: 5.00..50.00).round(2)},
    \"weight\": #{Faker::Number.within(range: 100..1000)},
    \"calories\": #{Faker::Number.within(range: 100..600)},
    \"fat\": #{Faker::Number.within(range: 5.00..20.00).round(2)},
    \"carbs\": #{Faker::Number.within(range: 5.00..20.00).round(2)},
    \"protein\": #{Faker::Number.within(range: 5.00..20.00).round(2)},
    \"time_consumed\": \"#{time}\",
    \"date_consumed\": \"#{Faker::Date.backward(days: 90)}\",
    \"type\": \"#{type}\",
    \"favorite\": \"#{rand(8)%4 == 0}\",
    \"procedence\": \"#{["homemade", "purchased"].sample}\"
  }
"""
  string += "," unless i+1 == quantity
end
string += "]"

File.write('data.json', string)