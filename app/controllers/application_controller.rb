require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
	use Rack::Flash

	configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, "personal_secret"
	end

	get '/' do
		erb :index
	end


	helpers do
		def logged_in?
			!!current_user
		end

		def current_user
			@current_user ||= User.find_by_id(session[:user_id])
		end
	end

end