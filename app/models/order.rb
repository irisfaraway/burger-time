class Order < ActiveRecord::Base
  has_and_belongs_to_many :burgers
  has_and_belongs_to_many :sides
  has_and_belongs_to_many :fillings

  before_validation :calculate_price

  # Requires an eater and a date
  validates :eater, :order_date, presence: true

  # Price must be more than 0, or blank
  validates :order_price, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  private

    # Add prices of the order's individual components for the total
    def calculate_price
      total_price = 0
      self.fillings.each do |filling|
        total_price += filling.price
      end
      self.sides.each do |side|
        total_price += side.price
      end
      self.update_attribute(:order_price, total_price)
    end

end
