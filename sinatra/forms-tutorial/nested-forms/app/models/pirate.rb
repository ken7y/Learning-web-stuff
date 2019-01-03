class Pirate
  attr_accessor :name, :weight, :height

  allPirates = []
  def initialize(params)
    @name = params[:name]
    @weight = params[:weight]
    @height = params[:height]
    allPirates << self
  end

  def self.all
    allPirates
  end

  def self.clear
    allPirates = []
  end


end
