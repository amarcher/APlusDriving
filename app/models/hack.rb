class Hack
  include HTTParty
  base_uri "http://api.hackthedrive.com/vehicles"

  def initialize
    @id = 'WBY1Z4C55EV273078' # hardcoded (demo car)
  end

  def status
    doors_locked = self.class.get("/#{@id}/door")
    windows_open = self.class.get("/#{@id}/window")
    p doors_locked
    p windows_open
    return {doors_locked: doors_locked['isVehicleLocked'], windows_open: windows_open['isDriverOpen']}
  end

end