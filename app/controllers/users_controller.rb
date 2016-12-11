class UsersController < ApplicationController

	get '/sign_up' do 
		erb :'user/new_user'
	end

	post '/users' do
		user = User.create(username: params[:username], password: params[:password])
		session[:user_id] = user.id
		redirect '/'
	end


end