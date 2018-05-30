class Tip < ApplicationRecord
  belongs_to :user
  has_many :tip_movies
  has_many :movies, through: :tip_movies
end
