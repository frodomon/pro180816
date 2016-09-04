class AddFieldToPurcharseorders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :supplier_id, :integer
    add_column :purchase_orders, :code, :string
    add_column :purchase_orders, :date_of_issue, :date
    add_column :vouchers, :date_of_issue, :date
    add_column :purchase_order_details, :purchase_order_id, :integer
    add_column :purchase_order_details, :article_id, :integer
    add_column :purchase_order_details, :quantity, :float,   :limit => 25
    add_column :purchase_order_details, :unit_price, :float,   :limit => 25
    add_column :purchase_order_details, :total_price, :float,   :limit => 25
  end
end
