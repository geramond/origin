puts 'What is triangle`s first side'
a = gets.chomp.to_i
puts 'What is triangle`s second side'
b = gets.chomp.to_i
puts 'What is triangle`s third side'
c = gets.chomp.to_i

arr = [a,b,c].sort
if ((arr[0]**2 + arr[1]**2) == (arr[2]**2))
  puts 'Triangle is rectangular'
end
if (a == b) && (b == c)
  puts 'Triangle is equilateral'
elsif (a == b) || (a == c) || (b == c)
  puts 'Triangle is isosceles'
end
