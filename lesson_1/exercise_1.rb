# Идеальный вес

puts 'Пожалуйста, введите ваше имя: '
name = gets.chomp.capitalize
puts 'Теперь введите свой рост в см.: '
height = gets.chomp.to_i
ideal_weight = height - 110

if ideal_weight < 0
  puts "#{name}, Ваш вес уже оптимальный."
else
  puts "#{name}, Ваш идеальный вес - #{ideal_weight}кг."
end