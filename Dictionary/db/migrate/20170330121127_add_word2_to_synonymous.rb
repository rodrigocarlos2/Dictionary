class AddWord2ToSynonymous < ActiveRecord::Migration[5.0]
  def change
    add_reference :synonymous, :word_2, foreign_key: true
  end
end
