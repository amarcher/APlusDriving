class DriversController < ApplicationController

	def index
		zendrive = Zendrive.new
		drivers = Driver.all
		driver_stats = []
		drivers.each do |driver|
			stats = zendrive.driver_data(driver.driver_id)
			stats['driver_id'] = driver.driver_id
			stats['driver_name'] = driver.name
			driver_stats << stats
		end
		render json: driver_stats
	end

end
