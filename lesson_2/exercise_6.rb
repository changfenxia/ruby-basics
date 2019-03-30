# Сумма покупок

shopping_cart = {}

loop do
  puts 'Введите название товара: '
  product_name = gets.chomp.downcase
  break if product_name == 'stop'

  puts 'Введите цену за единицу: '
  product_price = gets.to_f
  puts 'Введите кол-во купленного товара: '
  product_quantity = gets.to_f
  # Рассмотрел случай добавления двух одинаковых товаров, но не стал
  # рассматривать случай двух одинаковых товаров с разными ценами,
  # тогда бы хэшу добавил вложенность, чтобы он хранил разные цены
  if shopping_cart[product_name]
    shopping_cart[product_name][:quantity] += product_quantity
  else
    shopping_cart[product_name] = {price: product_price, quantity: product_quantity}
  end
end

puts 'Ваша Корзина: '
cost_total = 0
shopping_cart.each do |name, info|
  cost = (info[:price] * info[:quantity]).round(2)
  cost_total += cost
  puts "#{name.capitalize} | #{info[:price]}руб. за ед.
      | #{info[:quantity]}ед. | Итого: #{cost}руб."
end
puts "Итоговая стоимость всех товаров в корзине: #{cost_total}руб."
