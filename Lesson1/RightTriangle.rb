puts "What is triangle`s first side"
a = gets.chomp
a = a.to_i
puts "What is triangle`s second side"
b = gets.chomp
b = b.to_i
puts "What is triangle`s third side"
c = gets.chomp
c = c.to_i

max = a
if (b > c) && (b > max)
  max = b
  if ((a**2 + c**2) == (b**2))
    puts "Triangle is rectangular"
  end
elsif (c > b) && (c > max)
  max = c
  if ((a**2 + b**2) == (c**2))
    puts "Triangle is rectangular"
  end
elsif ((b**2 + c**2) ==(a**2))
  puts "Triangle is rectangular"
end

if (a == b) && (b == c)
  puts "Triangle is equilateral"
elsif (a == b) || (a == c) || (b == c)
  puts "Triangle is isosceles"
end
