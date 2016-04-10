class CreateFillings < ActiveRecord::Migration
  def change
    create_table :fillings do |t|
      t.string :name
      t.boolean :spicy
      t.decimal :price

      t.timestamps null: false
    end
  end
end
