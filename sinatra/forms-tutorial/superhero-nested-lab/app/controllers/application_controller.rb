require 'sinatra/base'
require_relative '../models/teams.rb'
require_relative '../models/hero.rb'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/' do
      @newTeam = Teams.new(params[:team])

      params[:team][:hero].each do |heroPeople|
        Heros.new(heroPeople)
      end
      @allHeros = Heros.all

      erb :team
    end
end
