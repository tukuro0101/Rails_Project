require "test_helper"

class CoffeeShopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coffee_shop = coffee_shops(:one)
  end

  test "should get index" do
    get coffee_shops_url
    assert_response :success
  end

  test "should get new" do
    get new_coffee_shop_url
    assert_response :success
  end

  test "should create coffee_shop" do
    assert_difference('CoffeeShop.count') do
      post coffee_shops_url, params: { coffee_shop: { description: @coffee_shop.description, location: @coffee_shop.location, name: @coffee_shop.name, rating: @coffee_shop.rating } }
    end

    assert_redirected_to coffee_shop_url(CoffeeShop.last)
  end

  test "should show coffee_shop" do
    get coffee_shop_url(@coffee_shop)
    assert_response :success
  end

  test "should get edit" do
    get edit_coffee_shop_url(@coffee_shop)
    assert_response :success
  end

  test "should update coffee_shop" do
    patch coffee_shop_url(@coffee_shop), params: { coffee_shop: { description: @coffee_shop.description, location: @coffee_shop.location, name: @coffee_shop.name, rating: @coffee_shop.rating } }
    assert_redirected_to coffee_shop_url(@coffee_shop)
  end

  test "should destroy coffee_shop" do
    assert_difference('CoffeeShop.count', -1) do
      delete coffee_shop_url(@coffee_shop)
    end

    assert_redirected_to coffee_shops_url
  end
end
