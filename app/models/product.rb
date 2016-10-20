class Product < ActiveRecord::Base
	belongs_to :category
	has_one :products_lot
end
