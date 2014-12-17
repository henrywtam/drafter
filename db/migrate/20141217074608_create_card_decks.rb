class CreateCardDecks < ActiveRecord::Migration
  def change
    create_table :card_decks do |t|
      t.belongs_to :deck
      t.belongs_to :card
      t.timestamps
    end
  end
end
