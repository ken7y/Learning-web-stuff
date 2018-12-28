class Application


  # @@ variables are like static variables in java
  # @ variables are just instance variables in java
  # they are only available to the specific instance of a class

  @@items = ["Japan","Brazil","Canada"]
  def call(env)
    resp = Rack::Response.new
    resp.write "Hello Countries \n"
    req = Rack::Request.new(env)

    # @@items.each do |item|
    #   resp.write "#{item}\n"
    # end

    # if the path equals items
    # then do the below actions
    # if it we on localhost:9292/items then the list of
    # Countries will be displayed
    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    else
      resp.write "Path not found"
    end


    resp.finish
  end

end
