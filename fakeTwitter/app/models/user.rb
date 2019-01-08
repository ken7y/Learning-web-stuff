require './config/environment'

class User
  attr_accessor :username, :password, :id

  def initialize(username,password,id=nil)
    @username = username
    @password = password
    @id = id
  end


  def self.create_table
    sql=<<-SQL
    CREATE TABLE IF NOT EXISTS logins (
       id INTEGER PRIMARY KEY,
       username TEXT,
       password TEXT
       )
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql=<<-SQL
    DROP TABLE logins
    SQL
    DB[:conn].execute(sql)
  end

  def save
    sql=<<-SQL
    INSERT INTO logins (username,password) VALUES (?,?)
    SQL
    DB[:conn].execute(sql,self.username,self.password)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM logins")[0][0]
    newUser = User.new(username,password,@id)
  end


    def self.new_from_db(row)
      newUser = User.new(row[1],row[2],row[0])
      newUser
    end


    def self.exists_or_not(username)
      sql=<<-SQL
      SELECT * FROM logins WHERE username = ?
      SQL
      DB[:conn].execute(sql,username).map do |row|
        newUser = new_from_db(row)
        if newUser.nil?
          return false
        else
          return true
        end
      end.first
    end










end
