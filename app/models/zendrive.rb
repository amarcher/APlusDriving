require 'date'

class Zendrive
  include HTTParty

  base_uri 'https://api.zendrive.com/v1'

  def initialize
    @apikey = "bqUu9FJxbii5AZFBnTVj0MQLzuqZSwjj"
  end

  def drivers
    url = "/drivers?apikey=#{@apikey}"
    driver_data = self.class.get(url)
    p driver_data
    driver_data['drivers']
  end

  def driver_data(driver_id)
    score_url = "/driver/#{driver_id}/score?apikey=#{@apikey}"
    trip_url = "/driver/#{driver_id}/trips?apikey=#{@apikey}"
    score_data = self.class.get(score_url)
    trip_data = self.class.get(trip_url)

    parse_driver_data(score_data, trip_data)
  end

  def parse_driver_data(score_data, trip_data)
    {scores: score_data, trips: trip_data}
  end

end