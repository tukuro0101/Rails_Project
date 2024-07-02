class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :coffee_shop

  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :comment, presence: true, length: { minimum: 10 }
  validates :customer_id, uniqueness: { scope: :coffee_shop_id, message: "has already reviewed this coffee shop" }
end
