class CreateDips < ActiveRecord::Migration
  def change
    create_table :dips do |t|
      t.string :name
      t.boolean :spicy
      t.decimal :price

      t.timestamps null: false
    end
  end
end
