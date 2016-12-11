class AddRepsAndWeightToExercises < ActiveRecord::Migration[5.0]
  def change
  	add_column :exercises, :reps, :integer
  	add_column :exercises, :weight, :integer 
  end
end
