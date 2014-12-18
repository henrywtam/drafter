class CreateCardPacks < ActiveRecord::Migration
  def change
    create_table :card_packs do |t|
      t.belongs_to :pack
      t.belongs_to :card
      t.timestamps
    end
  end
end
