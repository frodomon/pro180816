class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :names, :string
  end
end
