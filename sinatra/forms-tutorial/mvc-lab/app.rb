require_relative 'config/environment'
require_relative 'models/piglatinizer.rb'
class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/' do
    @texte = PigLatinizer.new(params[:newtext])
    erb :results
  end



end
