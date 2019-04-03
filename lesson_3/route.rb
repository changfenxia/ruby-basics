# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной

class Route
  attr_reader :starting_station, :ending_station

  def initialize(starting_station, ending_station)
    @starting_station = starting_station
    @ending_station = ending_station
    @way_stations = []
  end

  def add_station(station)
    @way_stations << station
  end

  def delete_station(station)
    @way_stations.delete(station)
  end

  def get_next_station_straight(station)
    return false if station == @ending_station

    current_index = full_route.index(station)
    full_route[current_index + 1]
  end

  def get_next_station_reverse(station)
    return false if station == @starting_station

    current_index = full_route.index(station)
    full_route[current_index - 1]
  end

  def get_previous_station_straight(station)
    return false if station == @starting_station

    current_index = full_route.index(station)
    full_route[current_index - 1]
  end

  def get_previous_station_reverse(station)
    return false if station == @ending_station

    current_index = full_route.index(station)
    full_route[current_index + 1]
  end

  def print_all_stations
    puts "Начальная: #{@starting_station.name}"
    puts 'Промежуточные станции:'
    @way_stations.each { |station| puts station.name }
    puts "Конечная: #{@ending_station.name}"
  end

  private

  def full_route
    [@starting_station, @way_stations, @ending_station].flatten
  end
end
