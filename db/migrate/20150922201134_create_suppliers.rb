class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :ruc
      t.string :address
      t.string :phone
      t.string :contact

      t.timestamps
    end
  end
end
