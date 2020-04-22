require_relative 'car1'
require_relative 'truck'
require_relative 'sport_car'

truck = Truck.new
truck.start_engine
puts "Truck RPM: #{truck.current_rpm}"

car = Car.new
car.start_engine
puts "Car RPM: #{car.current_rpm}"

sport_car = SportCar.new
sport_car.start_engine
puts "SportCar RPM: #{sport_car.current_rpm}"
