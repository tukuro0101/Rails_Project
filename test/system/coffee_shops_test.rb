require "application_system_test_case"

class CoffeeShopsTest < ApplicationSystemTestCase
  setup do
    @coffee_shop = coffee_shops(:one)
  end

  test "visiting the index" do
    visit coffee_shops_url
    assert_selector "h1", text: "Coffee Shops"
  end

  test "creating a Coffee shop" do
    visit coffee_shops_url
    click_on "New Coffee Shop"

    fill_in "Description", with: @coffee_shop.description
    fill_in "Location", with: @coffee_shop.location
    fill_in "Name", with: @coffee_shop.name
    fill_in "Rating", with: @coffee_shop.rating
    click_on "Create Coffee shop"

    assert_text "Coffee shop was successfully created"
    click_on "Back"
  end

  test "updating a Coffee shop" do
    visit coffee_shops_url
    click_on "Edit", match: :first

    fill_in "Description", with: @coffee_shop.description
    fill_in "Location", with: @coffee_shop.location
    fill_in "Name", with: @coffee_shop.name
    fill_in "Rating", with: @coffee_shop.rating
    click_on "Update Coffee shop"

    assert_text "Coffee shop was successfully updated"
    click_on "Back"
  end

  test "destroying a Coffee shop" do
    visit coffee_shops_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coffee shop was successfully destroyed"
  end
end
