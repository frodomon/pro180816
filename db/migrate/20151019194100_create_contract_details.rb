class CreateContractDetails < ActiveRecord::Migration
  def change
    create_table :contract_details do |t|
      t.integer :contract_id
      t.integer :article_id
      t.column :quantity,        :float,   :limit => 25
      t.column :unit_price,        :float,   :limit => 25
      t.column :total_price,        :float,   :limit => 25

      t.timestamps
    end
  end
end
