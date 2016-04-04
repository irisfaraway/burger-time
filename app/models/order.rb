class Order < ActiveRecord::Base
  # Requires an eater and a date
  validates :eater, :order_date, presence: true

  # Price must be more than 0, or blank
  validates :order_price, numericality: { greater_than: 0, allow_nil: true }
end