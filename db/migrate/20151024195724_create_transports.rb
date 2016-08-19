class CreateTransports < ActiveRecord::Migration
  def change
    create_table :transports do |t|
      t.string :plate
      t.string :inscriptions
      t.timestamps
    end
  end
end
