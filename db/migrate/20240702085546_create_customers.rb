class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :favorite_coffee_shop, foreign_key: { to_table: :coffee_shops }

      t.timestamps
    end
  end
end
