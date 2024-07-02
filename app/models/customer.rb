class Customer < ApplicationRecord
  belongs_to :favorite_coffee_shop, class_name: 'CoffeeShop', optional: true
   # A customer can have many reviews (one-to-many) 1.5
  has_many :reviews
   # A customer can have many reviewed coffee shops through reviews (many-to-many) 1.5
  has_many :reviewed_coffee_shops, through: :reviews, source: :coffee_shop

  #1.6 validations
 # First name must be present and at least 2 characters long
 validates :first_name, presence: true, length: { minimum: 2 }

 # Last name must be present and at least 2 characters long
 validates :last_name, presence: true, length: { minimum: 2 }

 # Email must be present, unique, and follow a valid email format
 validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

 #3.5
 paginates_per 10
end
