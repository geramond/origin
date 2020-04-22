

class SportCar < Car
  def start_engine
    puts "Click!!"
    super
    puts "Wrooom!!!"
  end

  protected

  def initial_rpm
    1500
  end
end
