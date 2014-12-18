class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.belongs_to  :st
      t.text        :card_type
      t.string      :card_types
      t.text        :colors
      t.string      :multiverseid
      t.string      :name
      t.text        :subtypes
      t.string      :rarity
      t.string      :power
      t.string      :toughness
      t.string      :manaCost
      t.string      :image_url
      t.timestamps
    end
  end
end
