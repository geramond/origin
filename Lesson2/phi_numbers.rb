arr = [0,1]
i = 2
while arr[i - 1] < 89 do
  arr.push(arr[i - 2] + arr[i - 1])
  i += 1
end
puts arr
