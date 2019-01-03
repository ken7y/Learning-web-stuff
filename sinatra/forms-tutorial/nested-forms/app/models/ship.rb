class Ship
  attr_accessor :name, :type, :booty

  allShip = []
  def initialize(args)
    @name = args[:name]
    @type = args[:type]
    @booty = args[:booty]
    allShip << self
  end

  def self.all
    allShip
  end

  def self.clear
    allShip = []
  end

end
