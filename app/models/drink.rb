class Drink < ActiveRecord::Base
  include Nameable

  has_and_belongs_to_many :orders

  # Price is required and must be more than 0
  validates :price, presence: true,
                    numericality: { greater_than: 0 }
end
