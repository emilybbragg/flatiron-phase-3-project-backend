class AddCategoryIdToExercise < ActiveRecord::Migration[6.1]
  def change
    add_column :exercises, :category_id, :integer
  end
end
