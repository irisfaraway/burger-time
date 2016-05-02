# created by running rails g migration create_join_table dip order
class JoinDipsOrders < ActiveRecord::Migration
  def change
    create_join_table :dips, :orders do |t|
      t.index [:dip_id, :order_id]
      t.index [:order_id, :dip_id]
    end
  end
end
