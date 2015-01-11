class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :event_type
    	t.string :lat
    	t.string :long
    	t.integer :charge
      t.string :battery
      t.string :fuel
      t.string :odometer
      t.string :temp_inside
      t.string :heading
      t.string :orientation
      t.string :elevation
      t.string :formatted_time
    	t.belongs_to :vehicle
      t.timestamps
    end
  end
end
