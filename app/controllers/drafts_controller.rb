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
    define_vars
    print_status
    deck_redirect?
  end
  def update
    define_vars
    print_status
    @round.packs.each do |pack|
      if pack.id == @current_pack.id
        card = CardPack.where(card_id: @card.id, pack_id: pack.id).first
        card.destroy
      else
        random_card_id = pack.cards[rand(pack.cards.count)].id
        card = CardPack.where(card_id: random_card_id, pack_id: pack.id).first
        card.destroy
      end
    end
    deck_redirect?
    respond_to do |format|
      format.json { render "next.js.erb" }
    end
  end
  private
    def define_vars
      if params["draft_id"]
        @draft = Draft.find(params["draft_id"].to_i)
        @deck = Deck.find(params["draft_id"].to_i)
        @pick = params["pick_id"].to_i
        @card = Card.find(params["card_id"].to_i)
        CardDeck.create(card_id: @card.id, deck_id: @deck.id)
      else
        @draft = Draft.find(params["id"].to_i)
        @deck = Deck.find(params["id"].to_i)
        @pick = @deck.cards.count + 1
      end
      @round = @draft.rounds[((@pick-1)/14)]
      @current_pack = @round.packs[((@pick-1)%14%8)]
      @next_pack = @round.packs[(@pick%14%8)]
    end
    def print_status
      pack_ids = []
      @round.packs.each { |pack| pack_ids << pack.id }
      current_card_ids = []
      @current_pack.cards.each { |card| current_card_ids << card.id }
      next_card_ids = []
      @next_pack.cards.each { |card| next_card_ids << card.id }
      p "Draft: #{@draft.id}" if @draft
      p "Round: #{@round.id}" if @round
      p "Round Packs: #{pack_ids}"
      p "Selected Card: #{@card.id}" if @card
      p "Current Pack: #{@current_pack.id}" if @current_pack
      p "Current Pack Cards: #{current_card_ids}"
      p "Next Pack: #{@next_pack.id}" if @next_pack
      p "Next Pack Cards: #{next_card_ids}" if @next_pack
    end
    def deck_redirect?
      if @pick >= 42
        redirect_to deck_path(@deck)
        return
      end
    end
end



