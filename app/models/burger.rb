class Burger < ActiveRecord::Base
  include Nameable

  has_and_belongs_to_many :orders

  # Description must be under 100 characters
  validates :description, length: { maximum: 120 }

  # Prices are required and must be more than 0
  validates :price_single, :price_double,
                    presence: true,
                    numericality: { greater_than: 0 }
end
