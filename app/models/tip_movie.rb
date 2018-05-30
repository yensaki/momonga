class TipMovie < ApplicationRecord
  belongs_to :tip
  belongs_to :movie
end
