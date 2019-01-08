require './config/environment'
require 'sinatra/base'
# require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base

  configure do
    set :views, "app/views"
    set :public_dir, "public"
  end

  get '/' do
    erb :index
  end

  post '/' do

  end

  get '/signup' do
    erb :signup
  end


  post '/signup' do
    newUser = User.new(params[:username],params[:password])
    User.create_table
    # "#{User.exists_or_not(params[:username])}"
    if User.exists_or_not(params[:username])
      "This user exists already"
    else
      newUser.save
      "Does not exists"
    end

  end



  # post '/' do
  #   text_from_user = params[:user_text]
  #   @newtext = TextAnalyzer.new(text_from_user)
  #
  #   erb :results
  # end
end
