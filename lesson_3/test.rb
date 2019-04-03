require_relative 'station'
require_relative 'route'
require_relative 'train'

msk = Station.new('Moscow')
vlad = Station.new('Vladivostok')
nsk = Station.new('Novosibirsk')
kha = Station.new('Khabarovsk')
bj = Station.new('Beijing')

mskbj= Route.new(msk, bj)
mskbj.add_station(nsk)
mskbj.add_station(kha)
mskbj.add_station(vlad)
mskbj.print_all_stations

my_new_shiny_train = Train.new(112)
my_new_shiny_train.assign_route(mskbj)
my_new_shiny_train.move_one_station_straight
my_new_shiny_train.move_one_station_straight
my_new_shiny_train.move_one_station_straight
puts vlad.get_trains_by_type('passenger')
my_new_shiny_train.move_one_station_reverse
my_new_shiny_train.move_one_station_reverse
my_new_shiny_train.move_one_station_reverse
my_new_shiny_train.move_one_station_straight
my_new_shiny_train.move_one_station_straight
my_new_shiny_train.move_one_station_straight
p my_new_shiny_train.next_station
my_new_shiny_train.move_one_station_straight

my_new_shiny_train.move_one_station_straight




