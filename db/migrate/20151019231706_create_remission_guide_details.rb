class CreateRemissionGuideDetails < ActiveRecord::Migration
  def change
    create_table :remission_guide_details do |t|
      t.integer :remission_guide_id
      t.integer :article_id
      t.column :quantity,        :float,   :limit => 25

      t.timestamps
    end
  end
end
