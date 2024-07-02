class Customer < ApplicationRecord
  belongs_to :favorite_coffee_shop, class_name: 'CoffeeShop'
   # A customer can have many reviews (one-to-many) 1.5
  has_many :reviews
   # A customer can have many reviewed coffee shops through reviews (many-to-many) 1.5
  has_many :reviewed_coffee_shops, through: :reviews, source: :coffee_shop

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
