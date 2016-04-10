class Filling < ActiveRecord::Base
  has_and_belongs_to_many :orders
  
  # Name is required, must be unique and under 30 characters
  validates :name, presence: true,
                   uniqueness: true,
                   length: { maximum: 30 }

  # Price is required and must be more than 0
  validates :price, presence: true,
                    numericality: { greater_than: 0 }
end
