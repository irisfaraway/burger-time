class Order < ActiveRecord::Base
  has_and_belongs_to_many :burgers
  has_and_belongs_to_many :dips
  has_and_belongs_to_many :fillings
  has_and_belongs_to_many :sides
  has_and_belongs_to_many :drinks

  before_validation :calculate_price

  # Requires an eater and a date
  validates :eater, :order_date, presence: true

  # Size must be single or double
  validates :size, presence: true, inclusion: { in: %w(single double) }

  # Comment must be 100 characters max
  validates :comment, length: { maximum: 100 }

  # Price must be more than 0, or blank
  validates :order_price, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  private

    # Add prices of the order's individual components for the total
    def calculate_price
      total_price = 0
      # Get burger cost based on size
      self.burgers.each do |burger|
        if size == 'single'
          total_price += burger.price_single
        elsif size == 'double'
          total_price += burger.price_double
        end            
      end
      # Add the cost of each extra filling
      self.fillings.each do |filling|
        total_price += filling.price
      end
      # Add the cost of each side
      self.sides.each do |side|
        total_price += side.price
      end
      # Add the cost of each dip
      self.dips.each do |dip|
        total_price += dip.price
      end
      # Add the cost of each drink
      self.drinks.each do |drink|
        total_price += drink.price
      end
      self.update_attribute(:order_price, total_price)
    end

end
