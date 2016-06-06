# Side object for order
class Side < ActiveRecord::Base
  include Nameable
  include Describable
  include Priceable

  has_and_belongs_to_many :orders
end
