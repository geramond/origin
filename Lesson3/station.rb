require_relative("route")
require_relative("train")

class Station
  attr_accessor :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def train_arrive(train)
    @trains << train unless @trains.include?(train)
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
      @trains.each do |train|
        puts train
      end
    else
      @trains.each do |train|
        puts train if train.train_type == type
    end
  end

  def trains_count(type = nil)
    get_trains(type).count
  end

  def to_s
    @name
  end
end
end
