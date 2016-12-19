class UsersController < ApplicationController

	get '/signup' do
		if logged_in?
			flash[:message] = "Must sign out first"
			redirect "/users/#{current_user.id}"
		else
			erb :'users/new_user'
		end
		
	end

	post '/users' do
		user = User.create(username: params[:username], password: params[:password])
		session[:user_id] = user.id
		flash[:message] = "Account Created"
		redirect to "/users/#{current_user.id}"
	end


	get '/login' do
		if logged_in?
			flash[:message] = "Already logged in"
			redirect "/users/#{current_user.id}"
		else
			erb :'users/login'
		end
	end

	post '/login' do 
		user = User.find_by(username: params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:message] = "Welcome"
			redirect to "/users/#{current_user.id}"
		else
			flash[:message] = "Incorrect Username or Password!"
			redirect '/'
		end

	end

	get '/logout' do 
		if logged_in?
			session.clear 
			redirect to '/'
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