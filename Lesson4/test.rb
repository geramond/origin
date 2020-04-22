require_relative("train")
require_relative("station")
require_relative("route")

puts 'CREATION'
train_1 = Train.new(001, 'Freight', 5)
train_2 = Train.new(002, 'Passenger', 7)

station_1 = Station.new('Moscow')
station_2 = Station.new('St.Petersburg')
station_3 = Station.new('NiNo')
station_4 = Station.new('Kazan')

route_1 = Route.new(station_1, station_2)
route_2 = Route.new(station_1, station_3)
route_3 = Route.new(station_3, station_4)
route_4 = Route.new(station_2, station_4)

puts 'Begin'

route_1.add_station(station_3)
route_1.del_station(station_3)
route_1.stations

route_4.add_station(station_1)
route_4.add_station(station_3)
route_4.stations

train_1.increase_speed(10)
puts train_1.speed

puts train_1.carriage_count
train_1.add_carriage_count
puts train_1.carriage_count

train_1.stop
train_1.add_carriage_count
train_1.add_carriage_count
puts train_1.carriage_count

train_1.del_carriage_count
puts train_1.carriage_count

puts '____________'
train_1.set_route(route_4)
train_2.set_route(route_3)
puts '____________'
train_1.current_station
puts '____________'
train_1.next_station
train_1.back_station
puts '____________'
train_1.current_station
puts '____________!'
train_1.move_forward
puts '____________'
train_1.current_station
train_1.move_forward
puts '____________'
train_1.current_station
train_1.move_forward
puts '____________'
train_1.current_station
train_1.move_back
train_1.current_station
train_1.move_back
train_1.current_station
puts '____________!!'
puts station_1.get_trains('Passenger')
puts '____________!!!'
puts station_1.get_trains('Freight')
