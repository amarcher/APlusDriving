require 'date'

class EventsController < ApplicationController

	def index
		@vehicle = Vehicle.find_by(VIN: params[:vehicle_id])

		if (params[:date])
			#TODO Remove (for diagnosis only)
			p params[:date]

			mojio = Mojio.new(@vehicle.mojio_id)

			#events from db
			date = DateTime.parse(params[:date])
			cached_events = @vehicle.events.where("created_at > ?", date.to_s).order(created_at: :asc)
			#events from mojio
			if cached_events.empty?
				new_events = mojio.events_after(date)
			else 
				new_events = mojio.events_after(cached_events.last['created_at'])
			end
			# store the events in the db
			new_events.each do |event|
				@vehicle.events << Event.create(event)
			end

			@events = cached_events + new_events
		else
			@events = @vehicle.events
		end

		render json: @events
	end

end
