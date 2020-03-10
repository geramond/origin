puts "What is your name?"
name = gets.chomp

puts "What is your birth year?"
year = gets.chomp

puts "#{name}, hello! You`re about #{2020 - year.to_i} year"