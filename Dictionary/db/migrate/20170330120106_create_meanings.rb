class CreateMeanings < ActiveRecord::Migration[5.0]
  def change
    create_table :meanings do |t|
      t.text :text
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
