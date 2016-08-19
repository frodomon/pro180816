class CreateContractDocuments < ActiveRecord::Migration
  def change
    create_table :contract_documents do |t|
      t.integer :contract_id
      t.attachment :document

      t.timestamps
    end
  end
end
