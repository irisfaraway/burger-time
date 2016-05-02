# created by running rails g migration create_join_table burger order
class JoinBurgersOrders < ActiveRecord::Migration
  def change
    create_join_table :burgers, :orders do |t|
      t.index [:burger_id, :order_id]
      t.index [:order_id, :burger_id]
    end
  end
end
