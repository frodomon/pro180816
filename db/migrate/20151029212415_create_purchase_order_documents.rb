class CreatePurchaseOrderDocuments < ActiveRecord::Migration
  def change
    create_table :purchase_order_documents do |t|
      t.integer :purchase_order_id
      t.attachment :document

      t.timestamps
    end
  end
end
