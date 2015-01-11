class AddFormattedTime < ActiveRecord::Migration
  def change
  	add_column :events, :formatted_time, :string
  end
end
