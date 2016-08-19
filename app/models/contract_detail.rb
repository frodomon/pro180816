class ContractDetail < ActiveRecord::Base
  belongs_to :contract
  belongs_to :article
end
