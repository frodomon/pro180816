class Category < ActiveRecord::Base
	has_one :product
end
