class Burger < ActiveRecord::Base
  # Name is required, must be unique and under 30 characters
  validates :name, presence: true,
                   uniqueness: true,
                   length: { maximum: 30 }

  # Description must be under 100 characters
  validates :description, length: { maximum: 100 }

  # Prices are required and must be more than 0
  validates :price_single, :price_double,
                    presence: true,
                    numericality: { greater_than: 0 }
end
