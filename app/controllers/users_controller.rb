class UsersController < ApplicationController

	get '/signup' do
		if logged_in?
			redirect "/users/#{current_user.id}"
		else
			erb :'users/new_user'
		end
		
	end

	post '/users' do
		user = User.create(username: params[:username], password: params[:password])
		session[:user_id] = user.id
		redirect to "/users/#{current_user.id}"
	end


	get '/login' do
		if logged_in?
			redirect "/users/#{current_user.id}"
		else
			erb :'users/login'
		end
	end

	post '/login' do 
		user = User.find_by(username: params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect to "/users/#{current_user.id}"
		else
			redirect '/signup'
		end

	end

	get '/logout' do 
		if logged_in?
			session.clear 
			redirect '/'
		else
			redirect '/'
		end
		
	end

	get	'/users/:id' do
	 if logged_in? 
	 	erb :'users/show'
	 else
	 	redirect '/login'
	 end
	end


end