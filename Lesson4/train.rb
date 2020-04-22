class Train
  attr_reader :speed, :train_number, :carriages, :route, :current_station, :type

  def initialize(train_number)
    @train_number = train_number.to_s
    @carriages = []
    @speed = 0
  end

  def stop
    self.speed = 0
  end

  def stopped?
    speed == 0
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

  def carriage_count
    carriages.count
  end

  def add_carriage(carriage)
    return if carriages.include?(carriage)
    carriages << carriage if stopeed? && right_type_of(carriage)
  end

  def del_carriage
    carriages.pop if stopeed? && carriages.any? > 0
  end

  def set_route(route)
      @route = route
      current_station.train_leave(self)
      self.current_station = route.first_station
      current_station.train_arrive(self)
  end

  def next_station
    @route.station_through(1, current_station)
  end

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

  private
  # methods are private because client code doesn`t use this methods. These methods used by another methods only.

  def current_station
    @route.stations.detect {|station| station.trains.include?(self)}
  end

  def right_type_of(carriage)
    carriage.type == type
  end

  def to_s
    [train_number, type].join(" - ")
  end

  # unnecessary methods
  #def current_station
  #  route.station.each do |station|
  #    if station == @current_station_index
  #      puts @current_station_index.name
  #    end
  #  end
  #end

  #def current_station_index
  #  @route.index(current_station)
  #end

  #def next_station
  #  return if current_station_index == @route.length
  #  @route.stations[current_station_index.to_i + 1]
  #end

  #def back_station
  #  return if current_station_index == 0
  #  @route.stations[current_station_index.to_i - 1]
  #end

end
