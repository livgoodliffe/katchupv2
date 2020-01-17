class Spot < ApplicationRecord
  has_many :images
  has_many :dishes
end
