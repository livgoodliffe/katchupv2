class Dish < ApplicationRecord
  belongs_to :spot
  has_many :reviews
end
