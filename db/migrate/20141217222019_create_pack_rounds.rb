class CreatePackRounds < ActiveRecord::Migration
  def change
    create_table :pack_rounds do |t|
      t.belongs_to :pack
      t.belongs_to :round
      t.timestamps
    end
  end
end
