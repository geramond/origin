months_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
result = 0

puts 'Enter day of mounth: '
date = gets.chomp.to_i

puts 'Enter month number: '
month = gets.chomp.to_i

puts 'Enter year number: '
year = gets.chomp.to_i

#for i in 0..month - 2
#  result += months_days[i]
#end

#if year % 400 == 0 && year % 100 == 0
#  result += 1
#elsif year % 4 == 0
#  result += 1
#end

months_days[1] = 29 if year % 400 == 0 && (year % 4 == 0 && year % 100 == 0)
result = months_days.take(month - 1).sum + date
puts "result is #{result}"
