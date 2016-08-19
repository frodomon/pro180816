class CreateRemissionGuides < ActiveRecord::Migration
  def change
    create_table :remission_guides do |t|
      t.integer :client_id
      t.integer :transport_id
      t.string :code
      t.string :initial_point
      t.string :final_point
      t.date :date_of_issue

      t.timestamps
    end
  end
end
