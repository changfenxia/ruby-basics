# ./driver.rb
# “Имеет имя, которое указывается при создании”
# “Может возвращать имя”
# “Может покупать и владеть автомобилями”
# “При покупке нового автомобиля наносит на его дверь свое имя”
# “Может возвращать список автомобилей, которыми владеет”
class Driver
  attr_reader :name, :cars

  def initialize(name)
    @name = name
    @cars = []
  end

  def buy_car(car)
    @cars << car
    car.change_door_title(self)
  end
end
