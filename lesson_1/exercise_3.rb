# Прямоугольный треугольник

puts 'Введите длину первой стороны треугольника: '
side_a = gets.to_f
puts 'Введите длину второй стороны треугольника: '
side_b = gets.to_f
puts 'Введите длину третьей стороны треугольника: '
side_c = gets.to_f

a, b, h = [side_a, side_b, side_c].sort

if a == b && b == h
  puts 'Треугольник равнобедренный и равносторонний, но не прямоугольный.'
elsif a**2 + b**2 == h**2
  if a == b
    puts 'Треугольник прямоугольный и равнобедренный.'
  else
    puts 'Треугольник прямоугольный.'
  end
else
  puts 'Треугольник не является прямоугольным.'
end
