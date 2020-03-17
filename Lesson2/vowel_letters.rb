alphabet = ('a'..'z').to_a
vowels = ['a','e','i','o','u','y']
result = {}
alphabet.each do |letter|
  if vowels.include?(letter)
    result[letter] = alphabet.index(letter) + 1
  end
end

puts result
