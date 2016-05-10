class Dip < ActiveRecord::Base
  include Nameable
  include Priceable

  has_and_belongs_to_many :orders

end
