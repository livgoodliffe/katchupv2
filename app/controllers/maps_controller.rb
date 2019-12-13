class MapsController < ApplicationController
  def index
    wishlist_spots = current_user.wishlist_spots
    visited_spots = current_user.visited_spots

    @markers_wishlist = wishlist_spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "maps/info-window", locals: { spot: spot }),
        image_url: helpers.asset_url('wishlist.png')
      }
    end

    @markers_visited = visited_spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "maps/info-window", locals: { spot: spot }),
        image_url: helpers.asset_url('visited.png')
      }
    end

    @markers = @markers_wishlist + @markers_visited
  end

  private

  def user_has_coords?
    current_user.latitude.present? && current_user.longitude.present?
  end

  def create_user_marker
    [{
      lat: current_user.latitude,
      lng: current_user.longitude
    }]
  end
end
