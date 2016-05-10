# Validations for item names
module Nameable
  extend ActiveSupport::Concern

  included do
    # Name is required, must be unique and under 40 characters
    validates :name, presence: true,
                     uniqueness: true,
                     length: { maximum: 40 }    
  end

end
