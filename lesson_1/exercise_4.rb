# Квадратное уравнение

puts 'Для решения квадратного уравнения, необходимо ввести коэффициенты a, b и с.'
puts 'Введите коэффициент a: '
a = gets.to_f
puts 'Введите коэффициент b: '
b = gets.to_f
puts 'Введите коэффициент c: '
c = gets.to_f

discriminant = b**2 - 4 * a * c

if discriminant < 0
  puts "Дискриминант равен #{discriminant}. Корней нет."
elsif discriminant.zero?
  puts "Дискриминант равен 0. Корень уравнения равен #{-1 * b / (2 * a)}"
else
  sqrt_d = Math.sqrt(discriminant)
  puts "Дискриминант равен #{discriminant}.\n
          Корень №1 равен #{(-1 * b - sqrt_d) / (2 * a)}.\n
          Корень №2 равен #{(-1 * b + sqrt_d) / (2 * a)}."
end
