class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def newsfeed
  end

  def friends
    require 'koala'

    # access_token and other values aren't required if you set the defaults as described above
    @graph = Koala::Facebook::API.new(access_token)

    @friends = @graph.get_connections("me", "friends")
  end
end
