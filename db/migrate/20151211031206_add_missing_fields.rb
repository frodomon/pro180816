class AddMissingFields < ActiveRecord::Migration
  def change
  	add_column :purchase_order_details, :production_date, :date
  	add_column :purchase_order_details, :lote, :string
  	add_column :articles, :trademark, :string
  end
end
