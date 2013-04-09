class Product < ActiveRecord::Base
  attr_accessible :name, :price

  def to_dollars
    price / 100.0
  end
end
