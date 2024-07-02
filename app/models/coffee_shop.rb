class CoffeeShop < ApplicationRecord
   # A coffee shop can have many reviews (one-to-many)1.5
  has_many :reviews
  # A coffee shop can have many reviews (1 to many) 1.4
   # A coffee shop can have many customers through reviews (many-to-many) 1.5
  has_many :customers, through: :reviews

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :description, presence: true, length: { minimum: 10 }
end
