class JoinDrinksOrders < ActiveRecord::Migration
  def change
    create_join_table :drinks, :orders do |t|
      t.index [:drink_id, :order_id]
      t.index [:order_id, :drink_id]
    end
  end
end
