class Pool < ActiveRecord::Base
  has_many :decks
  has_many :card_pools
  has_many :cards, through: :card_pools
end
