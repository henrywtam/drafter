class Card < ActiveRecord::Base
  has_many :drafts, :through => :card_drafts
  has_many :decks, :through => :card_decks
  belongs_to :st

  serialize :card_types, Array
  serialize :colors, Array
  serialize :subtypes, Array
end
