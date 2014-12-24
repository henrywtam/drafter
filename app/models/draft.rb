class Draft < ActiveRecord::Base
  has_many :rounds

  after_save :fill_draft

  def fill_draft
    3.times do
      self.rounds.create
    end
    self.rounds.each do |round|
      round.packs.each_with_index do |pack, index|
        pack.cards -= pack.cards.sample(index)
      end
    end
  end

end
