class CreateBurgers < ActiveRecord::Migration
  def change
    create_table :burgers do |t|
      t.string :name
      t.string :description
      t.boolean :spicy
      t.decimal :price_single
      t.decimal :price_double

      t.timestamps null: false
    end
  end
end
