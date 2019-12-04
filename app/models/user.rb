class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # mount_uploader :avatar, PhotoUploader

  devise :omniauthable, omniauth_providers: %i[facebook]

  def full_name
    "#{first_name} #{last_name}"
  end
end
