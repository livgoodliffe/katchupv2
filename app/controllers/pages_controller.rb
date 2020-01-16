class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:newsfeed]

  def newsfeed
    lat = current_user.latitude
    lon = current_user.longitude

    results = Geocoder.search([lat, lon])
    @suburb = results.first.suburb
    # try and get it to read closest city
  end

  def friends
    require 'koala'

    # access_token and other values aren't required if you set the defaults as described above
    @graph = Koala::Facebook::API.new(access_token)

    @friends = @graph.get_connections("me", "friends")
  end
end
