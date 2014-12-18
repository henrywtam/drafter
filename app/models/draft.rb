class Draft < ActiveRecord::Base
  has_many :rounds

  after_save :fill_draft

  def fill_draft
    3.times do
      self.rounds.create
    end
  end

end
