require_relative "../config/environment.rb"

class Dog
  attr_accessor :id, :name, :breed

  def initialize(dog,id=nil)
    @name = dog[:name]
    @breed = dog[:breed]
    @id = id
  end

  def self.create_table
    sql=<<-SQL
    CREATE TABLE IF NOT EXISTS dogs (
       id INTEGER PRIMARY KEY,
       name TEXT,
       grade TEXT
       )
    SQL
    DB[:conn].execute(sql)
  end


  def self.drop_table
    sql="
    DROP TABLE dogs
    "


    DB[:conn].execute(sql)

  end

  def save
    sql=<<-SQL
    INSERT INTO dogs (name,breed) VALUES (?,?)
    SQL

    DB[:conn].execute(sql,self.name,self.breed)
    newDogObject = Hash.new
    newDogObject[:name] = self.name
    newDogObject[:breed] = self.breed
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    newDog = Dog.new(newDogObject,@id)
    newDog

  end




  def self.new_from_db(row)
    newHashDog = Hash.new
    newHashDog[:name] = row[1]
    newHashDog[:breed] = row[2]
    @id = row[0]
    newDog = Dog.new(newHashDog,@id)
    newDog

  end


  def self.find_by_name(name)
    sql=<<-SQL
    SELECT * FROM dogs WHERE
    name = ?
    SQL

    DB[:conn].execute(sql,name).map do |row|
      new_from_db(row)
    end.first

  end

  def update
    sql =<<-SQL
    UPDATE dogs SET name = ?, breed = ? WHERE id = ?
    SQL


    DB[:conn].execute(sql,self.name,self.breed,self.id)

  end

  def self.create(dog)
    newDog = Dog.new(dog)
    newDog.save
  end

  def self.find_by_id(id)
    sql=<<-SQL
    SELECT * FROM dogs WHERE
    id = ?
    SQL

    DB[:conn].execute(sql,id).map do |id|
      new_from_db(id)
    end.first
  end

  def self.find_or_create_by(name:,breed:)
    dog = DB[:conn].execute("SELECT * FROM dogs where name = ? AND breed = ?",name,breed)

    if !dog.empty?
      dog_data = dog[0]
      newDogg = Hash.new
      newDogg[:name] = dog_data[1]
      newDogg[:breed] = dog_data[2]
      dog = Dog.new(newDogg,dog_data[0])
      dog
    else
      newDogg = Hash.new
      newDogg[:name] = name
      newDogg[:breed] = breed
      dog = self.create(newDogg)
    end
  end



end
