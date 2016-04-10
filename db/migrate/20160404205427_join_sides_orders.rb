# created by running rails g migration create_join_table side order
class JoinSidesOrders < ActiveRecord::Migration
  def change
    create_join_table :sides, :orders do |t|
      t.index [:side_id, :order_id]
      t.index [:order_id, :side_id]
    end
  end
end
