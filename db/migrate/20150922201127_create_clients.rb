class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :ruc
      t.string :address
      t.string :phone
      t.string :contact

      t.timestamps
    end
  end
end
