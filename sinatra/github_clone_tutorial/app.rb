require 'sinatra'
# define class app which will inherit from Sinatra::base
class App < Sinatra::Base

  get '/' do
    "Started my server using Shotgun!"

  end

end
