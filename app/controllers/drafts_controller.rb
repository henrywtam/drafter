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
    @pick = 0
    @draft = Draft.find(params["id"].to_i)
    @deck = Deck.find(params["id"].to_i)
    @round = @draft.rounds[@pick]
    @pack = @round.packs[@pick]
  end
  def update
    p params
    @draft = Draft.find(params["draft_id"].to_i)
    @deck = Deck.find(params["draft_id"].to_i)
    @card = Card.find(params["card_id"].to_i)
    CardDeck.create(card_id: @card.id, deck_id: @deck.id)
    @pick = params["pick_id"].to_i
    @round = @draft.rounds[@pick/14]
    @pack = @round.packs[@pick%8]

    respond_to do |format|
      format.json { render "next.js.erb" }
    end
  end
end
