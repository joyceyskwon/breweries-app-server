require 'rest-client'
require 'json'

# Get request to the API
breweries_string = RestClient.get('https://api.openbrewerydb.org/breweries')
breweries_hash = JSON.parse(breweries_string)

# Iterate through each show from API and create data for the rails api backend
puts "creating breweries"
breweries_hash.each do |b|
    Brewery.create(name: b["name"], brewery_type: b["brewery_type"], street: b["street"], city: b["city"], state: b["state"], postal_code: b["postal_code"], longitude: b["longitude"], latitude: b["latitude"], website_url: b["website_url"])
end 
puts "created breweries"