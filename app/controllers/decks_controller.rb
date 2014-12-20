class DecksController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @decks = Deck.all
  end
  def show
    @deck = Deck.find(params["id"].to_i)
    @cards = @deck.cards
  end
  def update
    p params
    @deck = Deck.find(params["id"].to_i)
    @cards = @deck.cards
  end
end
