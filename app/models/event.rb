class Event < ActiveRecord::Base
	attr_accessor :formatted_time
	belongs_to :vehicle

	before_create :format_time

	def format_time
		self['formatted_time'] = self.created_at.to_datetime.strftime("%b %-d, %-I:%M%P")
	end
end
