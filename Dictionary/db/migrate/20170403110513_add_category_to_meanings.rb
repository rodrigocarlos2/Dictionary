class AddCategoryToMeanings < ActiveRecord::Migration[5.0]
  def change
    add_reference :meanings, :category, foreign_key: true
  end
end
