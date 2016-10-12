class AddTrademarkToTransports < ActiveRecord::Migration
  def change
  	add_column :transports, :trademark, :string
  end
end
