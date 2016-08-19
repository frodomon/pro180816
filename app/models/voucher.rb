class Voucher < ActiveRecord::Base
  belongs_to :client
  has_many :voucher_details
  accepts_nested_attributes_for :voucher_details, :allow_destroy => true
end
