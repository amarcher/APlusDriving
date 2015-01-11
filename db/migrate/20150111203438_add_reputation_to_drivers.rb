class AddReputationToDrivers < ActiveRecord::Migration
  def change
  	add_column :drivers, :recommendation, :string
  	add_column :drivers, :rank, :string
  end
end
