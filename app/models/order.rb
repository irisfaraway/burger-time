# Order object
class Order < ActiveRecord::Base
  has_and_belongs_to_many :burgers
  has_and_belongs_to_many :dips
  has_and_belongs_to_many :fillings
  has_and_belongs_to_many :sides
  has_and_belongs_to_many :drinks

  before_validation :calculate_price, :calculate_payment_remainder

  # Requires an eater and a date
  validates :eater, :order_date, presence: true

  # Size must be single or double
  validates :size, presence: true, inclusion: { in: %w(single double) }

  # Comment must be 100 characters max
  validates :comment, length: { maximum: 100 }

  # Prices must be more than 0, or blank
  validates :order_price,
            :amount_paid,
            numericality: { greater_than_or_equal_to: 0,
                            allow_nil: true }

  private

  # Add prices of the order's individual components for the total
  def calculate_price
    total_price = 0
    # Get burger cost based on size
    burgers.each do |burger|
      if size == 'single'
        total_price += burger.price_single
      elsif size == 'double'
        total_price += burger.price_double
      end
    end
    # Add prices of all the non-burger items - would like to include burgers but they have multiple price attributes
    order_items = fillings + sides + dips + drinks
    order_items.each do |item|
      total_price += item.price
    end
    # Update the total price
    update_attribute(:order_price, total_price)
  end

  # Calculate unpaid amount
  def calculate_payment_remainder
    update_attribute(:amount_paid, 0) if amount_paid.nil?
    unpaid = order_price - amount_paid
    update_attribute(:payment_remainder, unpaid)
  end
end
