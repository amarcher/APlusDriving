class EventsController < ApplicationController

	def index
		@vehicle = Vehicle.find_by(VIN: params[:vehicle_id])

		if (params[:date])
			@events = @vehicle.events.where("created_at > ?", params[:date])
		else
			@events = @vehicle.events
		end

		render json: @events
	end

end
