class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id,name,type,db)
    @id = id
    @db = db
    @name = name
    @type = type
  end

  def self.save(name,type,database_connection)
    database_connection.execute("INSERT INTO pokemon(name,type) VALUES (?,?)",name,type)

  end


  def self.find(id,database_connection)
    database_connection.execute("SELECT * FROM pokemon WHERE id = ?",id)

    @newPokemon = Pokemon.new(id,
      database_connection.execute("SELECT NAME FROM pokemon WHERE id = ?",id)[0][0],
      database_connection.execute("SELECT TYPE FROM pokemon WHERE id = ?",id)[0][0],
      @db
    )
  end
end
