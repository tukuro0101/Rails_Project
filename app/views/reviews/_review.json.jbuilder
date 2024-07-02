json.extract! review, :id, :customer_id, :coffee_shop_id, :rating, :comment, :created_at, :updated_at
json.url review_url(review, format: :json)
