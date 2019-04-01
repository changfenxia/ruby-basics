require_relative 'car'
require_relative 'driver'

# ford = Car.new(119922)
# vasya = Driver.new('Vasso')
#
# ford.add_driver(vasya)
# ford.show_drivers

vaha = Driver.new('Vahabit')
boomer = Car.new(888888)

vaha.buy_car(boomer)
puts vaha.cars[0].door_title
