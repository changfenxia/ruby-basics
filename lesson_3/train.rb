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
  attr_reader :type, :number, :number_of_carriages, :current_speed, :current_station

  def initialize(number, type = :passenger, number_of_carriages = 10)
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
    @next_station = route.next_station(@current_station)
  end

  def move_one_station_forward
    if last_station?
      puts 'Уже на конечной'
      return false
    end

    gather_speed if current_speed.zero?
    @current_station.send_train(self)
    next_station.receive_train(self)
    @current_station = next_station
    stop
  end

  def move_one_station_back
    if first_station?
      puts 'На начальной станции'
      return false
    end

    gather_speed if current_speed.zero?
    @current_station.send_train(self)
    previous_station.receive_train(self)
    @current_station = previous_station
    stop
  end

  def next_station
    @route.next_station(@current_station)
  end

  def previous_station
    @route.previous_station(@current_station)
  end

  private

  def gather_speed(speed = 70)
    @current_speed = speed
  end

  def stop
    @current_speed = 0
  end

  def last_station?
    @current_station == @route.ending_station
  end

  def first_station?
    @current_station == @route.starting_station
  end
end
