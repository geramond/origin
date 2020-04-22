class CargoTrain < Train
  def initialize(train_number)
    @type = 'cargo'
    super
  end
end
