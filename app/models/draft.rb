class Draft < ActiveRecord::Base
  has_many :card_drafts
  has_many :cards, :through => :card_drafts
end
