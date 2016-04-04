class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :eater
      t.date :order_date
      t.decimal :order_price
      t.boolean :paid

      t.timestamps null: false
    end
  end
end
