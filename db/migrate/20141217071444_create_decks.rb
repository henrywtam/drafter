class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.belongs_to :pool, index: true
      t.timestamps
    end
  end
end
