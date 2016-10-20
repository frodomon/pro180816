class CreateProductsLots < ActiveRecord::Migration
  def change
    create_table :products_lots do |t|
      t.float :quantity,   :limit => 25
      t.string :sanitary_registry
      t.date :due_date
      t.string :lot_number
      t.date :production_date
      t.references :product, index: true, foreign_key: true

      t.timestamps
    end
  end
end
