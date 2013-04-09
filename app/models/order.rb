class Order < ActiveRecord::Base
  attr_accessible :product_id, :user_id, :quantity

  belongs_to :user
  has_many :products
end
