# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
# Может набирать скорость
# Может возвращать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может возвращать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
#     Может принимать маршрут следования (объект класса Route).
#         При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
#             Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
#     Возвращать предыдущую станцию, текущую, следующую, на основе маршрута

class Train
  attr_reader :type, :number, :number_of_carriages, :current_speed

  def initialize(number, type = 'passenger', number_of_carriages = 10)
    @number = number
    @type = type
    @number_of_carriages = number_of_carriages
    @current_speed = 0
  end

  def add_carriage
    @number_of_carriages += 1
  end

  def remove_carriage
    @number_of_carriages -= 1 if @number_of_carriages > 1
  end

  def assign_route(route)
    @route = route
    @current_station = route.starting_station
  end

  def move_one_station_straight
    @direction = :straight
    move
  end

  def move_one_station_reverse
    @direction = :reverse
    move
  end

  def next_station
    return false if route_end?

    if going_straight?
      @route.get_next_station_straight(@current_station)
    else
      @route.get_next_station_reverse(@current_station)
    end
  end

  def previous_station
    return false if route_start?

    if going_straight?
      @route.get_previous_station_straight(@current_station)
    else
      @route.get_previous_station_reverse(@current_station)
    end
  end

  private

  def move
    if route_end?
      announce_final_station
      return false
    end

    gather_speed if current_speed.zero?
    @current_station.send_train(self)
    next_station.receive_train(self)
    @current_station = next_station
    stop
    announce_way_station
    announce_final_station if route_end?
  end

  def route_end?
    going_straight? ? straight_direction_route_end? : reverse_direction_route_end?
  end

  def route_start?
    going_straight? ? reverse_direction_route_end? : straight_direction_route_end?
  end

  def straight_direction_route_end?
    true if @current_station == @route.ending_station
  end

  def reverse_direction_route_end?
    true if @current_station == @route.starting_station
  end

  def going_straight?
    @direction == :straight
  end

  def announce_way_station
    puts "Прибыли на станцию #{@current_station.name}."
  end

  def announce_final_station
    puts "Конечная станция!"
  end

  def gather_speed(speed = 70)
    @current_speed = speed
  end

  def stop
    @current_speed = 0
  end
end
