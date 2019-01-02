require 'sinatra'
# define class app which will inherit from Sinatra::base
class App < Sinatra::Base

  get '/' do
    "Started my server using Shotgun!"

  end

  get '/name' do
    "Hello my name is Ken"
  end

  get '/hometown' do
    "My hometown is in Sydney"
  end

  get '/favsong' do
    "My favourite song is Adele's Hello"
  end

end
