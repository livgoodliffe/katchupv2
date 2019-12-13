class MapsController < ApplicationController
  def index
    @spots = Spot.all

    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "maps/info-window", locals: { spot: spot }),
        image_url: helpers.asset_url('logo.png')
      }
    end

    # @marker_user = create_user_marker if user_has_coords?
    # @marker_user_avatar = current_user.thumbnail

    # wishlist_spots = current_user.wishlist_spots
    # @markers_wishlist = create_markers(wishlist_spots)

    # visited_spots = current_user.visited_spots
    # @markers_visited = create_markers(visited_spots)
  end

  private

  def create_markers(spots)
    spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "maps/info-window", locals: { spot: spot })
      }
    end
  end

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
