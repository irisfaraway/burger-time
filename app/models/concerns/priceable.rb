# Validations for item prices, excluding burgers
module Priceable
  extend ActiveSupport::Concern

  included do
    # Price is required and must be more than 0
    validates :price, presence: true,
                      numericality: { greater_than: 0 }   
  end

end
