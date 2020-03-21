class Station
  attr_accessor :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def train_arrive(train)
    @trains << train
  end

  def train_leave(train)
    if @trains.any?
      @trains.delete(train)
    else
      puts 'Station is empty!'
    end
  end

  def get_trains(type)
    if type.nil?
      @trins.each do |train|
        puts train
      end
    else
      @trains.each do |train|
        puts train if train.train_type == type
    end
  end
end

class Route
  attr_reader :stations
  def initialize(start_station, end_station)
    if start_station.class == Station && end_station.class == Station
      @stations = [start_station, end_station]
    else
      puts "Error! At least one of stations don`t exists"
    end
  end

  def add_station(station)
    if station.class == Station
      @stations.insert(-2, station)
    else
      puts "This station doesn`t exist! Please set station first!"
    end
  end

  def del_station(station)
    @stations.delete(station)
  end

  def to_s
    print 'Stations list: '
    @stations.each do |station|
      print "#{station.name}"
    end
  end
end

class Train
  attr_accessor :speed, :train_type, :carriage_count

  def initialize(train_number, train_type, carriage_count)
    @train_number = number
    @train_type = type
    @carriage_count = count
  end

  def stop
    self.speed = 0
    puts 'Stop!'
  end

  def increase_speed(speed)
    @speed += speed
  end

  def decrease_speed(speed)
    if @speed == 0
      puts 'Train is already stopped!'
    elsif @speed >= speed
      @speed -= speed
    elsif @speed < speed
      self.stop
    end
  end

  def add_carriage_count
    if @speed == 0
      @carriage_count += 1
    else
      puts "Can`t do this. Train didn`t stop!!!"
    end
  end

  def del_carriage_count
    if @speed == 0
      if carriage_count > 0
        @carriage_count -= 1
      else
        puts "Train already don`t have any carriages!"
      end
    else
      puts "Can`t do this. Train didn`t stop!!!"
    end
  end

  def set_route(route)
    if route.class == Route
      @route = route
      #@current_station = route.stations[0]
    else
      puts "Error! This route doesn`t exist"
    end
  end

#  def current_station
#    route.station.each do |station|
#      if station == @current_station
#        puts @current_station.name
#      end
#    end
#  end

  def current_station
    #@route.stations[@current_station_index]
    @route.stations.detect {|station| station.trains.include?(self)}
  end

  def move_to_station(station)
    #@current_station = station
    station.current_station
  end

  def next_station
    #if @route.index(@current_station) + 1 != nil
    if @route.current_station + 1 != nil
      @next_station = @route[@route.current_station + 1]
      puts @next_station.name
    else
      puts 'Error! Next station doesn`t exit!'
    end
  end

  def back_station
    #if @route.index(@current_station) - 1 != nil
    if @route.current_station - 1 != nil
      @back_station = @route[@route.current_station - 1]
      puts @back_station.name
    else
      puts 'Error! Back station doesn`t exit!'
    end
  end

end
end
