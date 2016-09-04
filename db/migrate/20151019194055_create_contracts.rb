class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :client_id
      t.string :name
      t.string :code
      t.date :date_of_issue

      t.timestamps
    end
  end
end
