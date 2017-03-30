class CreateSynonymous < ActiveRecord::Migration[5.0]
  def change
    create_table :synonymous do |t|

      t.timestamps
    end
  end
end
