class AddPaymentRemainderToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payment_remainder, :decimal
  end
end
