# Generates a random number between 1 and 5 three times
# and if all 3 numbers match then will print you win else
# it will print you lose


class Application

  def call(env)
    resp = Rack::Response.new
    resp.write "Hello my name is Ken\n"

    # generate a random number between 1 to 5
    num_1 = Kernel.rand(1..5)
    num_2 = Kernel.rand(1..5)
    num_3 = Kernel.rand(1..5)

    # code below just prints the variables
    resp.write "#{num_1}\n"
    resp.write "#{num_2}\n"
    resp.write "#{num_3}\n"

    if num_1==num_2 && num_2==num_3
      resp.write "You Win"
    else
      resp.write "You Lose"
    end

    resp.finish
  end

end
