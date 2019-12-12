class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @wishlist = current_user.wishlists
    @wishlist_spots = current_user.wishlist_spots.sort_by(&:name)

    @visiteds = current_user.visiteds
    @visited_spots = current_user.visited_spots.sort_by(&:name)
  end
end
