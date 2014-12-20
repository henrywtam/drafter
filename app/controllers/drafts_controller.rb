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
    @pick = @deck.cards.count
    if @pick >= 42
      redirect_to deck_path(@deck)
      return
    end
    @draft = Draft.find(params["id"].to_i)
    @round = @draft.rounds[((@pick-1)/14)]
    @pack = @round.packs[((@pick-1)%14%8)]
  end
  def update
    @draft = Draft.find(params["draft_id"].to_i)
    @deck = Deck.find(params["draft_id"].to_i)
    @card = Card.find(params["card_id"].to_i)
    CardDeck.create(card_id: @card.id, deck_id: @deck.id)
    @pick = params["pick_id"].to_i
    @round = @draft.rounds[((@pick-1)/14)]
    @pack = @round.packs[((@pick-1)%14%8)]
    # @round.packs.each do |pack|
    #   if @pack == pack
    #     p "here"
    #     @pack.cards.each do |card|
    #       p "inside"
    #       p card
    #       card.delete
    #       p "#{card.name} got deleted"
    #     end
    #   else
    #     p "Pack count: #{pack.cards.count}"
    #     random_card = rand(pack.cards.count-1)
    #     p random_card
    #     pack.cards[random_card].destroy
    #   end
    # end
    p "Draft: #{@draft.id}"
    p "Round: #{((@pick-1)/14)+1}"
    p "Pack: #{((@pick-1)%14%8)+1}"
    p "Pick: #{@pick}"
    if @pick >= 42
      redirect_to deck_path(@deck)
      return
    end
    respond_to do |format|
      format.json { render "next.js.erb" }
    end
    end
end