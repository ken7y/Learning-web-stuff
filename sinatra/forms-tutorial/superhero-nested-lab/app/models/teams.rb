class Teams
 attr_accessor :name, :motto

 ALLTEAMS = []
 def initialize(params)
   @name = params[:name]
   @motto = params[:motto]
   ALLTEAMS << self
 end

 def self.all
   ALLTEAMS
 end
end
