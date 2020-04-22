class PassengerTrain < Train
  def initialize(train_number)
    @type = 'passenger'
    super
  end
end
