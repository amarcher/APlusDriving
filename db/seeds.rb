# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

vehicle = Vehicle.create(VIN: 'WBY1Z4C58EV273611', mojio_id: '072cacd9-aa0a-4900-ac52-feb382c3be7d')
mojio = Mojio.new(vehicle.mojio_id)

events = mojio.events

# Create the events
events.each do |event|
	vehicle.events << Event.create(event)
end

zendrive = Zendrive.new
drivers = zendrive.drivers

drivers.each.with_index do |driver, index|
	driver_names = ['Yash', 'Andy', 'Jenn', 'Michael', 'Murat', 'Osman', 'John', 'Meg']
	Driver.create({
		driver_id: driver['driver_id'],
		name: driver_names[index], 
		rank: driver['rank'],
		recommendation: driver['recommendation']
	})
end