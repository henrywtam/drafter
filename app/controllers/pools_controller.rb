class PoolsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @pools = Pool.all
  end
  def show
    @pool = Pool.find(params["id"].to_i)
    @cards = @pool.cards
  end
  def update
    @pool = Pool.find(params["id"].to_i)
    @cards = @pool.cards
  end
end
