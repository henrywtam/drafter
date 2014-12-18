class DraftsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end
  def create
    @draft = Draft.create
    redirect_to edit_draft_path(@draft)
  end
  def edit
    @draft = Draft.find(params["id"].to_i)
  end
end
