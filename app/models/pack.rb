class Pack < ActiveRecord::Base
  has_many :card_packs
  has_many :cards, through: :card_packs
  has_many :pack_rounds
  has_many :rounds, through: :pack_rounds

  after_create :fill_pack

  def get_set
    return St.where( name: "Khans of Tarkir" ).first
  end

  def fill_pack
    mtgset = get_set
    commons = mtgset.get_cards(10, 'Common')
    uncommons = mtgset.get_cards(3, 'Uncommon')
    if contains_mythic?
      rare = mtgset.get_cards(1, 'Mythic Rare')
    else
      rare = mtgset.get_cards(1, 'Rare')
    end
    # if contains_foil?
    #   commons.pop
    #   commons.push(mtgset.cards.sample.make_foil)
    # end
    self.cards = commons + uncommons + rare
  end

  private

  def contains_mythic?
    return rand(8) == 0
  end

  # def contains_foil?
  #   return rand(6) == 0
  # end
end
