class Movie < ApplicationRecord
  has_one :tip_movie
  has_one :tip, through: :tip_movie
end
