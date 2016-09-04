class CreateVoucherDetails < ActiveRecord::Migration
  def change
    create_table :voucher_details do |t|
      t.integer :voucher_id
      t.integer :article_id
      t.column :quantity,        :float,   :limit => 25
      t.column :unit_price,        :float,   :limit => 25
      t.column :total_price,        :float,   :limit => 25

      t.timestamps
    end
  end
end
