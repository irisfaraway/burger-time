# Burger object for orders
class Burger < ActiveRecord::Base
  include Nameable
  include Describable

  # Should only be one burger per order but can't do has one, belongs to many - need to find better solution than this
  has_and_belongs_to_many :orders

  # Prices are required and must be more than 0
  validates :price_single, :price_double,
            presence: true,
            numericality: { greater_than: 0 }
end
