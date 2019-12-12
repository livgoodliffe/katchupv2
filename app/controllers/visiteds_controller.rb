class VisitedsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_visited, only: :destroy
  before_action :set_spot, only: :create

  def index
    @visiteds = current_user.visiteds
    @visited_spots = current_user.visited_spots.sort_by(&:name)
  end

  def create
    @spot = Spot.find(params[:spot_id])
    # remove from wishlist if you are adding it to your 'ive been there' list
    current_user.wishlists.destroy(in_wishlist?(@spot)) if in_wishlist?(@spot)
    current_user.visiteds.create(spot: @spot)

    respond_to do |format|
      format.html { redirect_to @spot }
      format.js
    end
  end

  def destroy
    visited = Visited.find(params[:id])
    @spot = visited.spot
    visited.destroy

    respond_to do |format|
      format.html { redirect_to @spot }
      format.js
    end
  end

  private

  def set_visited
    @visited = Visited.find(params[:id])
  end

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end

  def visited_params
    params.require(:visited).permit(:spot_id)
  end

  def in_wishlist?(spot)
    current_user.wishlists.find_by spot_id: spot[:id]
  end
end
