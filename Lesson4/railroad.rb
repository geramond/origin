class Railroad
  attr_reader :stations, :routes, :trains, :carriages

  def initialize
    @stations = []
    @routes = []
    @trains = []
    @carriages = []
  end

  TRAIN_TYPES = [PassengerTrain, CargoTrain]

  def show_collection(collection)
    collection.each.with_index(1) do |item, index|
      puts "#{index} - #{item}"
    end
  end

  def show_assets
    puts 'Stations list: '
    show_collection(@stations)
    puts 'Trains list: '
    show_collection(@trains)
    puts 'Routes list: '
    show_collection(@routes)
  end

  def print_state
    system("clear")
    puts '----------------'
    show_assets
    puts '----------------'
  end

  def menu(manu_action = :none)
    print_state
    puts ''
    puts '1. Create station'
    puts '2. Create train'
    puts '3. Create route'
    puts '4. Set route to train'
    puts '5. Attach carriage'
    puts '6. Detach carriage'
    puts '7. Manage train'
    puts '8. Stations and trains at station list'
    puts '9. Add station to route'
    puts '10. Delete station from route'
    puts '0. Exit'
  end

  def create_station
    puts "Enter station name: "
    name = gets.chomp
    return puts("Station #{name} is already exists") if find_station(name)
    @stations << Station.new(name)
    puts("Station #{name} successfully created")
  end

  #def create_train(type)
  #  puts "Select train type. 1 for passenger, 2 for cargo"
  #  train_type = select_from_collection(TRAIN_TYPES)
  #  return if train_type.nil?
  #  puts "Enter train number: "
  #  train_number = gets.chomp
  #  return puts("Train #{train_number} is already exists") if find_train(train_number)
  #  @trains << train_type.new(train_number)
  #end

  def create_train(type)
    puts "Enter train number: "
    train_number = gets.chomp
    return puts("Train #{train_number} is already exists") if find_train(train_number)
    @trains << Object.const_get("#{type}Train").new(train_number)
    puts "Train #{train_number} (#{type}) created successfully"
  end

  def create_route
    puts 'Choose start_station index'
    show_collection(@stations)
    start_station = select_from_collection(@stations)

    puts 'Choose end_station index'
    show_collection(@stations)
    end_station = select_from_collection(@stations)

    return if start_station.nil? || end_station.nil?
    return if start_station == end_station

    @routes << Route.new(start_station, end_station)
  end

  def assign_route
    puts 'Choose train index'
    show_collection(@trains)
    train = select_from_collection(@trains)

    puts 'Choose route index'
    show_collection(@routes)
    route = select_from_collection(@routes)

    train.set_route(route)
  end

  def add_route_station
    puts 'Choose route index'
    show_collection(@routes)
    route = select_from_collection(@routes)

    puts 'Enter index to add station (index from route start)'
    position = gets.chomp.to_i

    puts 'Choose transit station'
    show_collection(@stations)
    transit_station = select_from_collection(@stations)
    if route.add_station_at(position, transit_station)
      puts 'Route refreshed'
      route.to_s
    else
      puts 'Can`t add station. Possibly you add station to start or end'
    end
  end

  def remove_route_station
    puts 'Choose route index'
    show_collection(@routes)
    route = select_from_collection(@routes)

    puts 'Choose station to delete'
    show_collection(route.stations)
    station_to_delete = select_from_collection(route.stations)

    route.del_station(station_to_delete)
  end

  def attach_carriage_controller
    puts 'Enter train index to attach carriage'
    show_collection(@trains)
    train = select_from_collection(@trains)
    puts 'Choose carriage type: 1 - Passenger; 2 - Cargo'
    carriage = gets.chomp.to_i
    case carriages
    when 1
      train.add_carriage(PassengerCarriage.new)
    when 2
      train.add_carriage(CargoCarriage.new)
    end
  end

  def detach_carriage_controller
    puts 'Enter train index to detach carriage'
    show_collection(@trains)
    train = select_from_collection(@trains)
    puts 'Choose carriage to detach'
    show_collection(train.carriages)
    carriage = gets.chomp.to_i
    train.del_carriage
  end

  def train_controller
    puts 'Enter train index to manage train'
    show_collection(@trains)
    train = select_from_collection(@trains)
    puts 'Choose move direction: 1 - forward, 2 - back'
    direction = gets.chomp.to_i
    case direction
    when 1
      train.move_forward
      puts "Current station is #{train.current_station}"
    when 2
      train.move_back
      puts "Current station is #{train.current_station}"
    end
  end

  def select_from_collection(collection)
    index = gets.chomp.to_i - 1
    return if index.negative?
    collection[index]
  end

  def find_station(name)
    @stations.find {|s| s.name == name}
  end

  def find_train(train_number)
    @trains.find {|s| s.train_number == train_number}
  end

  def run
    loop do
      menu
      choice = gets.chomp.to_i
      case choice
      when 1 then create_station
      when 2 then create_train
      when 3 then create_route
      when 4 then assign_route
      when 5 then attach_carriage_controller
      when 6 then detach_carriage_controller
      when 7 then train_controller
      when 8 then show_assets
      when 9 then add_route_station
      when 10 then remove_route_station
      when 0 then break
    end
  end

  def seed
    @cargo_train = CargoTrain.new
    @passenger_train = PassengerTrain.new

    @cargo_carriage1 = CargoCarriage.new
    @cargo_carriage2 = CargoCarriage.new
    @cargo_carriage3 = CargoCarriage.new
    @passenger_carriage1 = PassengerCarriage.new
    @passenger_carriage2 = PassengerCarriage.new
    @passenger_carriage3 = PassengerCarriage.new

    @station1 = Station.new('msk')
    @station2 = Station.new('nno')
    @station3 = Station.new('kzn')
    @station4 = Station.new('spb')

    @route1 = Route.new(@station1, @station4)

    @cargo_train.set_route(@route1)
  end
end
end
