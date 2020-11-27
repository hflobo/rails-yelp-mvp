class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: %w[chinese italian japanese french belgian] }

  def average_rating
    reviews = self.reviews
    total = reviews.inject(0) { |sum, review| sum + review[:rating] }
    avg = total.fdiv(reviews.count).round(2)
    avg.nan? ? 'none' : avg
  end
end
