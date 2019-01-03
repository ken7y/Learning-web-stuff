class Heros
  attr_accessor :name, :power, :bio

  ALLHEROS = []
  def initialize(arg)
    @name = arg[:name]
    @power = arg[:power]
    @bio = arg[:bio]
    ALLHEROS << self
  end
  
  def self.all
    ALLHEROS
  end



end
