class Song

  attr_accessor :title, :artist

  def initialize(title,artist)
    @title = title
    @artist = artist
  end

end

class Application

  @@songs = [Song.new("Sorry", "Justin Bieber"),
    Song.new("Hello","Adele"),
      Song.new("Sweat","David Guetta,Snoop Dogg")]

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path.match(/songs/)
        song_title = req.path.split("/songs/").last
        song = @@songs.find{|s| s.title == song_title}

        resp.write song.artist
      end

      resp.finish
    end
  end
