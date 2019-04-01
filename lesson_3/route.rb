# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной

class Route
  attr_reader :way_stations, :starting_station, :ending_station
  attr_accessor :full_route

  def initialize(starting_station, ending_station)
    @starting_station = starting_station
    @ending_station = ending_station
    @way_stations = []
    @full_route = [starting_station, ending_station]
  end

  def add_station(station)
    way_stations << station
    @full_route = [starting_station, way_stations, ending_station].flatten
  end

  def delete_station(station)
    way_stations.delete station
    @full_route = [starting_station, way_stations, ending_station].flatten
  end

  def get_next_station(station, direction = 'straight')
    current_index = full_route.index(station)
    if direction == 'straight'
      full_route[current_index + 1]
    else
      full_route[current_index - 1]
    end
  end

  def print_all_stations
    puts "Начальная: #{starting_station.name}"
    puts 'Промежуточные станции:'
    way_stations.each { |station| puts station.name }
    puts "Конечная: #{ending_station.name}"
  end
end
