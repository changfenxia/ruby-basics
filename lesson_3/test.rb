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
p my_new_shiny_train.previous_station # дает false, потому что это начальная

my_new_shiny_train.move_one_station_forward
my_new_shiny_train.move_one_station_forward
my_new_shiny_train.move_one_station_forward
puts vlad.get_trains_by_type(:passenger)

my_new_shiny_train.move_one_station_back
my_new_shiny_train.move_one_station_back
my_new_shiny_train.move_one_station_back
p my_new_shiny_train.next_station # Novosibirsk
my_new_shiny_train.move_one_station_back # корректно показывает, что это мы на начальной
my_new_shiny_train.move_one_station_forward
my_new_shiny_train.move_one_station_forward
my_new_shiny_train.move_one_station_forward
p my_new_shiny_train.next_station
my_new_shiny_train.move_one_station_forward
p my_new_shiny_train.next_station # дает false, потому что это уже конечная

my_new_shiny_train.move_one_station_forward




