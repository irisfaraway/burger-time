class Burger < ActiveRecord::Base
  include Nameable
  include Describable

  has_and_belongs_to_many :orders

  # Prices are required and must be more than 0
  validates :price_single, :price_double,
                    presence: true,
                    numericality: { greater_than: 0 }
end
