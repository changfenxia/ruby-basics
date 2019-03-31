# Заполнить массив числами фибоначчи до 100

# Способ 1 - через переменные

fib1 = 0
fib2 = 1
fib_array = [fib1, fib2]

loop do
  fib1, fib2 = fib2, fib1 + fib2
  break if fib2 > 100
  
  fib_array << fib2
end

puts fib_array

# Способ 2 - через массив

fib_array2 = [0, 1]

loop do
  current = fib_array2[-1] + fib_array2[-2]
  break if current > 100

  fib_array2 << current
end

# puts fib_array2
