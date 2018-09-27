class Brewery < ApplicationRecord
  include RatingAverage

  validates :name, uniqueness: true, presence: true
  validates :year, numericality: { only_integer: true, greater_than_or_equal_to: 1040 }
  validate :creation_date_can_not_be_in_the_future

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

  def restart
    self.year = 2018
    puts "changed year to #{year}"
  end

  def creation_date_can_not_be_in_the_future
    return nil unless year? && year > Date.today.year
    errors.add(:year, "can't be in the future")
  end
end
