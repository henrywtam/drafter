class Round < ActiveRecord::Base
  belongs_to :draft
  has_many :pack_rounds
  has_many :packs, through: :pack_rounds

  after_save :fill_round

  def fill_round
    8.times do
      self.packs.create
    end
  end
end
