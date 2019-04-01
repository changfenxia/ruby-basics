# ./car.rb

class Car
  attr_accessor :color
  attr_reader :number, :door_title

  def initialize(number)
    @number = number
    @color = 'white'
    @door_title = ''
  end

  def beep
    puts 'beep beep'
  end

  def change_door_title(driver)
    @door_title = driver.name if driver.cars.include? self
  end

  # def add_driver(driver)
  #   @drivers << driver
  # end
  #
  # def show_drivers
  #   @drivers.each do |driver|
  #     puts driver.name
  #   end
  # end
end
