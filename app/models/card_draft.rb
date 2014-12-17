class CardDraft < ActiveRecord::Base
  belongs_to :card
  belongs_to :draft
end
