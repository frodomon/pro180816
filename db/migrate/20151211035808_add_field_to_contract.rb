class AddFieldToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :missing_payment, :float,   :limit => 25
    add_column :contract_details, :missing_article, :float,   :limit => 25
  end
end
