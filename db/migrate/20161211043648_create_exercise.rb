class CreateExercise < ActiveRecord::Migration[5.0]
  def change
  	create_table :exercises do |t|
  		t.string :name
  		t.string :user_id  		
  	end
  end
end
