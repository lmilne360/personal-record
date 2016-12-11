class UsersController < ApplicationController

	get '/signup' do 
		erb :'users/new_user'
	end

	post '/users' do
		user = User.create(username: params[:username], password: params[:password])
		session[:user_id] = user.id
		redirect '/'
	end


	get '/login' do
		erb :'users/login'
	end

	post '/login' do 
		user = User.find_by(username: params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect '/'
		else
			redirect '/signup'
		end

	end

	get '/logout' do 
		session.clear
		redirect '/'
	end


end