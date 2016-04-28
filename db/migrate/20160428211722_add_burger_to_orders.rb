class AddBurgerToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :burger, index: true
  end
end
