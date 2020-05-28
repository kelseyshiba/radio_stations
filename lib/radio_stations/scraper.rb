class Scraper

    def self.grab_stations
        url = "https://de1.api.radio-browser.info/json/stations"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        array = JSON.parse(response)

        array.each do |radio_hash|
            radio_station = Radio.new(name: radio_hash["name"])
            radio_station.url = radio_hash["url_resolved"]
            radio_station.tags = radio_hash["tags"]
            radio_station.country = radio_hash["country"]
            radio_station.country_code = radio_hash["countrycode"]
            radio_station.state = radio_hash["state"]
            radio_station.votes = radio_hash["votes"]
        end
    end
  
end
