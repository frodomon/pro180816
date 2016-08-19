class PurchaseOrder < ActiveRecord::Base
  belongs_to :supplier
  has_many :purchase_order_details
  has_many :purchase_order_documents
  accepts_nested_attributes_for :purchase_order_details, :allow_destroy => true
  accepts_nested_attributes_for :purchase_order_documents, :allow_destroy => true
end
