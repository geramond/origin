require_relative("route")
require_relative("station")

class Train
  attr_accessor :speed, :train_type, :carriage_count

  def initialize(train_number, train_type, carriage_count)
    @train_number = train_number
    @train_type = train_type
    @carriage_count = carriage_count.to_i
    @speed = 0
  end

  def stop
    self.speed = 0
    puts 'Train is stoped!'
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
      if @carriage_count > 0
        @carriage_count -= 1
      else
        puts "Train already don`t have any carriages!"
      end
    else
      puts "Can`t do this. Train didn`t stop!!!"
    end
  end

  def set_route(route)
    #if route.class == Route
      @route = route
      current_station = route.stations[0]
      #@route.stations.first
      #Here I suppose we should do 'arrive train' to 'current station'
      #current_station.train_arrive(self)
    #else
    #  puts "Error! This route doesn`t exist"
    #end
  end

#  def current_station
#    route.station.each do |station|
#      if station == @current_station_index
#        puts @current_station_index.name
#      end
#    end
#  end

  def current_station
    @route.stations.detect {|station| station.trains.include?(self)}
  end

  def current_station_index
    @route.index(current_station)
  end

  #def next_station
  #  return if current_station_index == @route.length
  #  @route.stations[current_station_index.to_i + 1]
  #end

  def next_station
    @route.station_through(1, current_station)
  end

  #def back_station
  #  return if current_station_index == 0
  #  @route.stations[current_station_index.to_i - 1]
  #end

  def back_station
    @route.station_through(-1, current_station)
  end

  def move_forward
    return unless next_station
    destination_station = next_station
    current_station.train_leave(self)
    destination_station.train_arrive(self)
  end

  def move_back
    return unless back_station
    destination_station = back_station
    current_station.train_leave(self)
    destination_station.train_arrive(self)
end
end
