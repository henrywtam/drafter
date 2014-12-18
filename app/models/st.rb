class St < ActiveRecord::Base
  has_many :cards

  def get_cards(number, rarity)
    self.cards.select {|card| card.rarity == rarity}.sample(number)
  end
end
