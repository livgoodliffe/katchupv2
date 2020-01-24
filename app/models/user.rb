class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  # not sure what this is:
  attr_accessor :remote_content_url

  # mount_uploader :avatar, PhotoUploader

  has_many :visiteds
  has_many :wishlists

  has_many :visited_spots, through: :visiteds, source: :spot
  has_many :wishlist_spots, through: :wishlists, source: :spot

  def remember_me
    true
  end

  def visited_spot?(spot)
    visiteds.where(spot: spot).any?
  end

  def find_visiteds(spot)
    visiteds.where(spot: spot).first
  end

  def wishlisted_spot?(spot)
    wishlists.where(spot: spot).any?
  end

  def find_wishlist(spot)
    wishlists.where(spot: spot).first
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name")
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end
end
