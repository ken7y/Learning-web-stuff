# tldr this program will display what is in cart
# by going to http://localhost:9292/add?q=item
# you can insert your item and then go back to
# http://localhost:9292/cart to view the new updated cart

class Application

  @@cart = ["Chicken","Bread","Pizza"]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    resp.write"Started\n"

    if req.path.match(/cart/)
      @@cart.each do |cart_item|
        resp.write "#{cart_item}\n"
      end

    elsif req.path.match(/add/)
      added_item = req.params["q"]
      resp.write "#{added_item} successfully added to cart\n"
      @@cart << added_item

    else
      resp.write "Path not found"
      resp.status = 404

    end

    resp.finish
  end

end
