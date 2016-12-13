class ExercisesController < ApplicationController


	get '/exercise/new' do
		if logged_in? 
			erb :'exercises/new_exercise'
		else 
			redirect '/login'
		end
	end

	post '/exercise' do 
		ex = Exercise.new(name: params[:name])
		ex.user_id = current_user.id 
		ex.save
		flash[:message] = "Successfully created exercise"
		redirect to "/users/#{current_user.id}"
	end

	get '/exercise/:id' do
		if logged_in?
			if @ex = Exercise.find_by_id(params[:id]) && @ex.user == current_user
				erb :'exercises/update_exercise'
			else
				redirect "/users/#{current_user.id}"
			end
		else 
			redirect '/login'
		end
	end

	patch '/exercise/:id' do
		ex = Exercise.find_by_id(params[:id])
		ex.update(reps: params[:reps]) unless params[:reps].empty?
		ex.update(weight: params[:weight]) unless params[:weight].empty?
		flash[:message] = "Successfully updated exercise"
		redirect to "/users/#{current_user.id}"
	end

	delete '/exercise/:id/delete' do
		if logged_in?
			ex = Exercise.find_by_id(params[:id])
			ex.delete if ex.user == current_user
			flash[:message] = "Exercise deleted"
			redirect "/users/#{current_user.id}"
		else
			redirect '/login'
		end

	end



end