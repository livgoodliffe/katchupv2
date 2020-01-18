class KatchupDeviseController < ApplicationController
  layout 'without_navbar'

  def new
    # checks if user is signed in and redirect root to spots_path
    if user_signed_in?
      redirect_to newsfeed_path
    end
  end
end
