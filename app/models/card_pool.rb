class CardPool < ActiveRecord::Base
  belongs_to :card
  belongs_to :pool
end
