class AddDueDateToPurchaseOrderDetail < ActiveRecord::Migration
  def change
  	add_column :purchase_order_details, :due_date, :date
  end
end
