class Contract < ActiveRecord::Base
  belongs_to :client
  has_many :contract_details
  has_many :contract_documents
  accepts_nested_attributes_for :contract_details, :allow_destroy => true
  accepts_nested_attributes_for :contract_documents, :allow_destroy => true
end
