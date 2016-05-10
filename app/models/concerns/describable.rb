# Validations for item descriptions
module Describable
  extend ActiveSupport::Concern

  included do
    # Description must be under 120 characters
    validates :description, length: { maximum: 120 }
  end

end
