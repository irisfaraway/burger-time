# Order object
class Order < ActiveRecord::Base
  # Should only be one burger per order but can't do has one, belongs to many - need to find better solution than this
  has_and_belongs_to_many :burgers
  # I am more okay with these being HABTM but still room for refactoring
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

  # Get burger cost based on size
  def choose_burger_price
    @burger_price = 0
    burgers.each do |burger|
      if size == 'single'
        @burger_price += burger.price_single
      elsif size == 'double'
        @burger_price += burger.price_double
      end
    end
  end

  # Add prices of the order's individual components for the total
  def calculate_price
    total_price = 0
    # Add price of the burger
    choose_burger_price
    total_price += @burger_price
    # Add prices of all the non-burger items - would like to include burgers but they have multiple price attributes
    order_items = fillings + sides + dips + drinks
    order_items.each do |item|
      total_price += item.price
    end
    # Update the total price of the order
    update_attribute(:order_price, total_price)
  end

  # Calculate unpaid amount
  def calculate_payment_remainder
    update_attribute(:amount_paid, 0) if amount_paid.nil?
    unpaid = order_price - amount_paid
    update_attribute(:payment_remainder, unpaid)
  end
end
