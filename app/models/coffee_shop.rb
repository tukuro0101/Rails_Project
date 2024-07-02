class CoffeeShop < ApplicationRecord
  # A coffee shop can have many reviews (one-to-many)1.5
 has_many :reviews
 # A coffee shop can have many reviews (1 to many) 1.4
  # A coffee shop can have many customers through reviews (many-to-many) 1.5
 has_many :customers, through: :reviews

  # A coffee shop can have many customers as their favorite coffee shop
 has_many :favorited_by_customers, class_name: 'Customer', foreign_key: 'favorite_coffee_shop_id'

 #1.6 validations
 # Name must be present and unique
 validates :name, presence: true, uniqueness: true

 # Location must be present
 validates :location, presence: true

 # Rating must be present and a number between 0 and 5
 validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

 # Description must be present and at least 10 characters long
 validates :description, presence: true, length: { minimum: 10 }




 #3.5
 paginates_per 10

 #4.2
 before_save :format_rating

 private

  def format_rating
    self.rating = rating.round(1)
  end
end
