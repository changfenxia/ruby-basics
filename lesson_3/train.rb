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
    @current_station = nil
    @route = nil
    @direction = 'straight'
  end

  def gather_speed(speed = 70)
    @current_speed = speed
  end

  def stop
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

  def move(speed = 70)
    if final_point?
      puts "Поезд уже на конечной!"
      return
    end
    gather_speed(speed) if @current_speed.zero?
    @current_station.send_train(self)
    @current_station = @route.get_next_station(@current_station, @direction)
    @current_station.receive_train(self)
    puts "Прибыли на станцию #{@current_station.name}."
    puts 'Конечная!' if final_point?
    stop
  end

  def final_point?
    if @direction == 'straight' && @current_station == @route.ending_station
      true
    elsif @direction == 'reverse' && @current_station == @route.starting_station
      true
    else
      false
    end
  end

  def change_direction
    if @direction == 'straight'
      @direction = 'reverse'
      puts "Поезд развернулся и пойдет в обратном направлении по маршруту
            #{@route.ending_station.name} - #{@route.starting_station.name}"
    else
      @direction = 'straight'
      puts "Поезд развернулся и пойдет по маршруту:
            #{@route.starting_station.name} - #{@route.ending_station.name}"
    end
  end
end
