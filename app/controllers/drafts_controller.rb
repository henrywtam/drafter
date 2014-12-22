class DraftsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end
  def create
    @draft = Draft.create
    @deck = Deck.create
    redirect_to draft_path(@draft)
  end
  def show
    @deck = Deck.find(params["id"].to_i)
    @pick = @deck.cards.count + 1
    # p "PICK: #{@pick}"
    if @pick > 42
      redirect_to deck_path(@deck)
      return
    end
    @draft = Draft.find(params["id"].to_i)
    @round = @draft.rounds[((@pick-1)/14)]
    @current_pack = @round.packs[((@pick-1)%14%8)]

    # pack_ids = []
    # @round.packs.each do |pack|
    #   pack_ids << pack.id
    # end
    # current_card_ids = []
    # @current_pack.cards.each do |card|
    #   current_card_ids << card.id
    # end
    # p "current_pack: #{@current_pack.id}"
    # p "pack_ids: #{pack_ids}"
    # p "current_card_ids: #{current_card_ids}"
  end
  def update
    @draft = Draft.find(params["draft_id"].to_i)
    @deck = Deck.find(params["draft_id"].to_i)
    @card = Card.find(params["card_id"].to_i)
    CardDeck.create(card_id: @card.id, deck_id: @deck.id)
    @pick = params["pick_id"].to_i
    @round = @draft.rounds[((@pick-1)/14)]

    @current_pack = @round.packs[((@pick-1)%14%8)]
    @next_pack = @round.packs[(@pick%14%8)]

    pack_ids = []
    @round.packs.each do |pack|
      pack_ids << pack.id
    end
    current_card_ids = []
    @current_pack.cards.each do |card|
      current_card_ids << card.id
    end

    p "current_pack: #{@current_pack.id}"
    p "next_pack: #{@next_pack.id}"
    p "pack_ids: #{pack_ids}"
    p "card: #{@card.id}"
    p "current_card_ids: #{current_card_ids}"

    print_status
    @round.packs.each do |pack|
      if pack.id == @current_pack.id
        p "match"
        card = CardPack.where(card_id: @card.id, pack_id: pack.id).first
        p card
        card.destroy
      else
        p "not match"
        random_card_id = pack.cards[rand(pack.cards.count)].id
        card = CardPack.where(card_id: random_card_id, pack_id: pack.id).first
        p card
        card.destroy
      end
    end
    if @pick >= 42
      redirect_to deck_path(@deck)
      return
    end
    respond_to do |format|
      format.json { render "next.js.erb" }
    end
  end
  private
    def print_status
      p "Draft: #{@draft.id}"
      p "Round: #{((@pick-1)/14)+1}"
      p "Current_Pack: #{((@pick-1)%14%8)}"
      p "Next_Pack: #{((@pick)%14%8)}"
      p "Pick: #{@pick}"
    end
end