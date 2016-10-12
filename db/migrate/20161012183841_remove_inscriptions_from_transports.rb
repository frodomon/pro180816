class RemoveInscriptionsFromTransports < ActiveRecord::Migration
  def change
  	remove_column :transports, :inscriptions
  end
  
end
