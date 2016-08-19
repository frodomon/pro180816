class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :code
      t.string :unit_of_measurement
      t.string :stock

      t.timestamps
    end
  end
end
