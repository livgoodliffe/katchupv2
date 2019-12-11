class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def newsfeed

    @spots = Spot.all

    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude
      }
    end

  end

  def friends
    require 'koala'

    # access_token and other values aren't required if you set the defaults as described above
    @graph = Koala::Facebook::API.new(access_token)

    @friends = @graph.get_connections("me", "friends")
  end
end
