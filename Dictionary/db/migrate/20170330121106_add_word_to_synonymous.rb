class AddWordToSynonymous < ActiveRecord::Migration[5.0]
  def change
    add_reference :synonymous, :word, foreign_key: true
  end
end
