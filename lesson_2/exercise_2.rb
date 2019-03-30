# Заполнить массив числами от 10 до 100 с шагом 5

# способ 1 - через loop
my_array = []

i = 10
loop do
  my_array << i
  i += 5
  break if i > 100
end

puts my_array

# способ 2 через range
puts (10..100).step(5).to_a
