class VoucherDetail < ActiveRecord::Base
  belongs_to :voucher
  belongs_to :article
end
