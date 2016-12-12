class ChangeExerciseColumn < ActiveRecord::Migration[5.0]
  def change
  	change_column :exercises, :user_id, :integer
  end
end
