class CreateCardDrafts < ActiveRecord::Migration
  def change
    create_table :card_drafts do |t|
      t.belongs_to :draft
      t.belongs_to :card
      t.timestamps
    end
  end
end
