class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
    	t.string :name
    	t.string :driver_id
      t.timestamps
    end
  end
end
