class Car
attr_writer :speed
attr_reader :speed

attr_reader :engine_volume

  def initialize(speed = 0, engine_volume = 1.6)
    @speed = speed
    @engine_volume = engine_volume
    beep
    current_speed
  end

  def start_engine
    puts 'Wroom!'
  end

  def beep
    puts 'Beep Beep!!'
  end

  def stop
    puts 'Stop!!!'
    self.speed = 0
  end

  def go
    self.speed = 50
    beep
  end
end
