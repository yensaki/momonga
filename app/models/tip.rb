class Tip < ApplicationRecord
  belongs_to :user
  has_many :tip_movies
  has_many :movies, through: :tip_movies
  has_one :tip_body, dependent: :destroy
  has_many :tags, as: :taggable
  has_many :keywords, through: :tags
end
