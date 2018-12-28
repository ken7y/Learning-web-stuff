# prints good morn in the morn and good arvo in the arvo
class Application

  def call(env)
    resp = Rack::Response.new
    time = Time.new


    if time.hour < 12
      resp.write "Good Morning"
    else
      resp.write "Good Afternoon"
    end

    resp.finish
  end

end
