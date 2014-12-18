class CardPack < ActiveRecord::Base
  belongs_to :card
  belongs_to :pack
end
