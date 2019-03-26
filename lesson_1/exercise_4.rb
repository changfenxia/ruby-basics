# Квадратное уравнение

puts 'Для решения квадратного уравнения, необходимо ввести коэффициенты a, b и с.'
puts 'Введите коэффициент a: '
a = gets.chomp.to_f
puts 'Введите коэффициент b: '
b = gets.chomp.to_f
puts 'Введите коэффициент c: '
c = gets.chomp.to_f

discriminant = b**2 - 4 * a * c

if discriminant < 0
  puts "Дискриминант равен #{discriminant}. Корней нет."
elsif discriminant.zero?
  puts "Дискриминант равен 0. Корень уравнения равен #{-1 * b / (2 * a)}"
else
  puts "Дискриминант равен #{discriminant}.
Корень №1 равен #{(-1 * b - Math.sqrt(discriminant)) / (2 * a)}.
Корень №2 равен #{(-1 * b + Math.sqrt(discriminant)) / (2 * a)}."
end
