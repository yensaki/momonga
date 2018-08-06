class Keyword < ApplicationRecord
  has_many :tags
  has_many :tips, through: :tags
end
