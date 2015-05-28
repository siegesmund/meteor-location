class Location

  @currentLocation: ->
    if (Geolocation.error() or Geolocation.currentLocation() == null)
      location = GeoIp.currentLocation()
      location.api = 'ip'
    else
      location = Geolocation.currentLocation()
      location.api = 'position'
    location

  @error: -> Geolocation.error()

  @latLng: ->
    location = Location.currentLocation()
    if (location.coords and location.coords.latitude and location.coords.longitude)
      return {lat: location.coords.latitude, lng: location.coords.longitude}
    else
      return null
