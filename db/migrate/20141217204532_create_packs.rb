class CreatePacks < ActiveRecord::Migration
  def change
    create_table :packs do |t|
      t.timestamps
    end
  end
end
