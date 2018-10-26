class Geocodio
  include HTTParty
  base_uri 'api.geocod.io/v1.3'
  def self.geocode(query)
    get("/geocode?q=#{query}&api_key=#{ENV['GEOCODIO_API_KEY']}&fields=timezone")
  end
end