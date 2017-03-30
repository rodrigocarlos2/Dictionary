class AddWordToSynonymous < ActiveRecord::Migration[5.0]
  def change
    add_reference :synonymous, :word_1, foreign_key: true
  end
end
