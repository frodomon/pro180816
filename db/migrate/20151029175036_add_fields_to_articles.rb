class AddFieldsToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :sanitary_registry, :string
  	add_column :articles, :category_id, :integer
  end
end
