class CreateCoffeeShops < ActiveRecord::Migration[6.1]
  def change
    create_table :coffee_shops do |t|
      t.string :name
      t.string :location
      t.float :rating
      t.text :description

      t.timestamps
    end
  end
end
