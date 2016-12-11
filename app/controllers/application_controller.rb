require './config/environment'

class ApplicationController < Sinatra::Base

	configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, "personal_secret"
	end

	get '/' do
		erb :index
	end

end