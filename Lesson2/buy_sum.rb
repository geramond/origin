basket = {}
result = 0

puts 'Enter stop to end'
loop do
  puts 'Enter product name: '
  name = gets.chomp
  break if name == "stop"

  puts 'Enter product price: '
  price = gets.chomp.to_f

  puts 'Enter product count: '
  count = gets.chomp.to_f

  basket[name] = {price => count}
end

puts basket

basket.each do |name, price|
  puts "#{name} cost is #{price.keys.first * price.values.first}"
  result += price.keys.first * price.values.first
end

puts "Total sum is: #{result}"
