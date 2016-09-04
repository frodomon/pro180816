class AddFieldsToPurchaseOrders < ActiveRecord::Migration
  def change
  	add_column :purchase_orders, :billing_address, :string
  	add_column :purchase_orders, :delivery_address, :string
  	add_column :purchase_orders, :order_date, :date
  	add_column :purchase_orders, :delivery_date, :date
  end
end
