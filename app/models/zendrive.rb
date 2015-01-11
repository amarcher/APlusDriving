require 'date'

class Zendrive
  include HTTParty

  base_uri 'https://api.zendrive.com/v1'

  def initialize
    @apikey = 'bqUu9FJxbii5AZFBnTVj0MQLzuqZSwjj'
  end

  def trips(driver)
    url = "/driver/#{driver}/trips?apikey=#{@apikey}"
    trip_data = self.class.get(url)
    parse_trips(trip_data, driver)
  end

  def trips_after(drivers,time)
  	recent_trips = []
  	drivers.each do |driver|
    	url = "/driver/#{driver}/trips?apikey=#{@apikey}"
    	trip_data = self.class.get(url)
    	p recent_trips
    	recent_trips += parse_trips(trip_data,driver).select {|trip| trip.created_at > time}
    end
    return recent_trips
  end

  def parse_trips(trip_data, driver)
    data = trip_data
    return data.map do |event|
      {
        event_type: format_event(event['Trip']),
        driver: driver,
        created_at: event['Time'],
        lat: event['Location']['Lat'],
        long: event['Location']['Lng']
      }
    end
  end

end