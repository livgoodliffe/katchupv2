class MapsController < ApplicationController
  def index
    @spots = Spot.all

    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude
      }
    end
  end
end
