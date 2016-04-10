# created by running rails g migration create_join_table filling order
class JoinFillingsOrders < ActiveRecord::Migration
  def change
    create_join_table :fillings, :orders do |t|
      t.index [:filling_id, :order_id]
      t.index [:order_id, :filling_id]
    end
  end
end
