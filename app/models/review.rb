class Review < ApplicationRecord
  # A review belongs to a customer (many-to-one)1.5
  belongs_to :customer

  belongs_to :coffee_shop
   # A review belongs to a coffee shop (many to 1) 1.4 adn 1.5

  #1.6 validations
  # Rating must be present, an integer, and between 1 and 5
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  # Comment must be present and at least 10 characters long
  validates :comment, presence: true, length: { minimum: 10 }

  # Ensure a customer can only leave one review per coffee shop
  validates :customer_id, uniqueness: { scope: :coffee_shop_id, message: "has already reviewed this coffee shop" }
end
