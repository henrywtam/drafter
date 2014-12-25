class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.belongs_to :draft, index: true
      t.timestamps
    end
  end
end
