class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @wishlist_spots = current_user.wishlists

    @visited_spots = current_user.visiteds
  end
end
