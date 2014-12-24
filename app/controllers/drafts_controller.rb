require 'pp'

class DraftsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end
  def create
    @deck = Deck.create
    @draft = Draft.create
    redirect_to draft_path(@draft)
  end
  def show
    define_vars
    print_status
  end
  def update
    define_vars
    print_status
    select_card
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
      else
        @draft = Draft.find(params["id"].to_i)
        @deck = Deck.find(params["id"].to_i)
        @pick = @deck.cards.count + 1
      end
      deck_redirect?
      @round = @draft.rounds[((@pick-1)/14)%3]
      @current_pack = @round.packs[((@pick-1)%14%8)]
      if @pick == 14 || @pick == 28
        @round = @draft.rounds[((@pick-1)/14) + 1]
        @next_pack = @round.packs[(@pick%14%8)]
      else
        @next_pack = @round.packs[(@pick%14%8)]
      end
    end
    def print_status # mainly used for debugging
      pack_ids = []
      @round.packs.each { |pack| pack_ids << pack.id }
      current_card_ids = []
      @current_pack.cards.each { |card| current_card_ids << card.id }
      next_card_ids = []
      @next_pack.cards.each { |card| next_card_ids << card.id }
      p "Pick: #{@deck.cards.count + 1}"
      p "Draft: #{@draft.id}" if @draft
      p "Round: #{@round.id}" if @round
      p "Round Packs: #{pack_ids}"
      p "Selected Card: #{@card.id}" if @card
      p "Current Pack: #{@current_pack.id}" if @current_pack
      p "Current Pack Cards: #{current_card_ids}"
      p "Next Pack: #{@next_pack.id}" if @next_pack
      p "Next Pack Cards: #{next_card_ids}" if @next_pack
    end
    def select_card
      CardDeck.create(card_id: @card.id, deck_id: @deck.id)
      CardPack.where(card_id: @card.id, pack_id: @current_pack.id).first.destroy
      @current_pack.cards.delete(@card)
      chosen_cards = @current_pack.cards.shuffle.first(7)
      chosen_card_ids = []
      chosen_cards.each { |card| chosen_card_ids << card.id }
      chosen_card_ids.each do |id|
        CardPack.where(card_id: id, pack_id: @current_pack.id).first.destroy
      end
    end
    def deck_redirect?
      if @pick >= 42
        redirect_to deck_path(@deck)
        return
      end
    end
end



