class CreateSts < ActiveRecord::Migration
  def change
    create_table :sts do |t|
      t.string    :name
      t.string    :code
      t.string    :releaseDate
      t.string    :block
      t.timestamps
    end
  end
end
