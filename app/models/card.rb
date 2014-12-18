class Card < ActiveRecord::Base
  has_many :card_decks
  has_many :decks, through: :card_decks
  has_many :card_packs
  has_many :packs, through: :card_packs
  belongs_to :st


  serialize :card_types, Array
  serialize :colors, Array
  serialize :subtypes, Array
end
