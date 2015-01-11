class VehiclesController < ApplicationController

	def show
		@vehicle = Vehicle.find_by(VIN: params[:id])
		mojio = Mojio.new(@vehicle.mojio_id)
		hackthedrive = Hack.new
		@status = mojio.status
		hackthedrive.status.each do |key,value|
			@status[key] = value
		end

		render json: @status
	end

end
