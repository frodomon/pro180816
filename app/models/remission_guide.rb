class RemissionGuide < ActiveRecord::Base
  belongs_to :client
  has_many :remission_guide_details
  accepts_nested_attributes_for :remission_guide_details, :allow_destroy => true
end
