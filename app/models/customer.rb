class Customer < ApplicationRecord
  belongs_to :favorite_coffee_shop, class_name: 'CoffeeShop'
  has_many :reviews
  has_many :reviewed_coffee_shops, through: :reviews, source: :coffee_shop
end
