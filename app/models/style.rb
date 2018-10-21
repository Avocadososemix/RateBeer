class Style < ApplicationRecord
  include RatingAverage
  extend TopItems

  has_many :beers
  has_many :ratings, through: :beers

  def to_s
    name
  end
end
