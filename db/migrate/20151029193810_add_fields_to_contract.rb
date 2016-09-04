class AddFieldsToContract < ActiveRecord::Migration
  def change
  	add_column :contracts, :start_date, :date
  	add_column :contracts, :end_date, :date
  	add_column :contracts, :final_price, :float,   :limit => 25
  end
end
