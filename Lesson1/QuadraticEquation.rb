puts "Enter first coefficient"
a = gets.chomp
a = a.to_i
puts "Enter second coefficient"
b = gets.chomp
b = b.to_i
puts "Enter third coefficient"
c = gets.chomp
c = c.to_i

d = (b**2) - 4 * a * c
if d < 0
  puts "Discriminant is #{d}, don`t have roots"
elsif d == 0
  x = (-b) / (2 * a)
  puts "Discrimintant is #{d}, root is #{x}"
else
  x1 = ((-b) + Math.sqrt(d)) / (2 * a)
  x2 = ((-b) - Math.sqrt(d)) / (2 * a)
  puts "Discrimintant is #{d}, roots are: x1 = #{x1}, x2 = #{x2}"
end
