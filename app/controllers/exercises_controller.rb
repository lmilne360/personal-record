class ExercisesController < ApplicationController


	get '/exercise/new' do 
		erb :'exercise/new_exercise'
	end

	post '/exercise' do 
		ex = Exercise.new(name: params[:name])
		binding.pry
	end
end