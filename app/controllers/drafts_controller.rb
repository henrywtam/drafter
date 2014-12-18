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
    @draft = Draft.find(params["id"].to_i)
    respond_to do |format|
      format.json { render "cards" }
    end
  end
end
