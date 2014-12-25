class CreateCardPools < ActiveRecord::Migration
  def change
    create_table :card_pools do |t|
      t.belongs_to :pool
      t.belongs_to :card
      t.timestamps
    end
  end
end
