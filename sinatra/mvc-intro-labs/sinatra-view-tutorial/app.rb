require_relative 'config/environment'

class App < Sinatra::Base

	get '/' do
		# so by just the line below, Sinatra will render a file called
		# index.erb inside a directory called views.
		erb :index
	end

	get '/info' do
		erb :info
	end

	get '/dogs' do
		erb :dogs
	end

end
