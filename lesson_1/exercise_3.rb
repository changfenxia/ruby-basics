# Прямоугольный треугольник

puts 'Введите длину первой стороны треугольника: '
side_a = gets.chomp.to_f
puts 'Введите длину второй стороны треугольника: '
side_b = gets.chomp.to_f
puts 'Введите длину третьей стороны треугольника: '
side_c = gets.chomp.to_f

sides = [side_a, side_b, side_c].sort

if side_a == side_b && side_c == side_a
  puts 'Треугольник равнобедренный и равносторонний, но не прямоугольный.'
elsif sides[0]**2 + sides[1]**2 == sides[2]**2
  if sides[0] == sides[1]
    puts 'Треугольник прямоугольный и равнобедренный.'
  else
    puts 'Треугольник прямоугольный.'
  end
else
  puts 'Треугольник не является прямоугольным.'
end
