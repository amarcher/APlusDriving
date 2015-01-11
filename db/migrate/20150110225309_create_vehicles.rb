class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
    	t.string :name
    	t.string :VIN
    	t.string :mojio_id
      t.timestamps
    end
  end
end
