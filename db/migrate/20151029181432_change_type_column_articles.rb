class ChangeTypeColumnArticles < ActiveRecord::Migration
  def change
  	change_column :articles, :stock, :float,   :limit => 25
  end
end
