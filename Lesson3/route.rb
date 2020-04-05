require_relative("train")
require_relative("station")

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
    if station.class == Station
      @stations.delete(station)
    else
      puts "This station doesn`t exist! Please set station first!"
    end
  end

  def to_s
    print 'Stations list: '
    @stations.each do |station|
      print "#{station.name}"
    end
  end

  def index(station)
    return unless @stations.include?(station)
    current_station_index = stations.index(station)
  end

  def length
    @stations.length
  end
end
