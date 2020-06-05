class Radio
    attr_accessor :name, :url, :country, :country_code, :state, :votes, :tags
 
    
    @@all = []
    @@my_list = []

    def initialize(hash)
        @name = hash["name"]
        @url = hash["url"]
        @country = hash["country"]
        @country_code = hash["country_code"]
        @state = hash["state"]
        @votes = hash["votes"]
        @tags = hash["tags"]
        @@all << self
    end

    def self.all
        @@all
    end

    def self.clear_all
        @@all.clear
    end

    def self.cap_countries
        self.all.collect do |station|
            capitalized = station.country.to_s.split.map(&:capitalize).join(' ')
        end
    end

    def add_station(station)
        @@my_list << station
    end
    
    def self.my_list
        @@my_list
    end

    def self.display_my_list
        puts ""
        puts Rainbow("MY LIST").green.underline
        puts ""
        
        self.my_list.each do |station|
            puts Rainbow("Station Name: #{station.name}").green
            puts "Station URL: #{station.url}"
            puts "Station Country: #{station.country}"
            puts "Tags: #{station.tags}"
            puts "Votes: #{station.votes}"
            puts ""
        end
        
        puts ""
        puts Rainbow("Nice list!").yellow
        puts ""
    end

    # def self.countries_that_start_with(array) # ["A", "B", "C", "D", "E", "F"]
    #     string = array.map(&:inspect).join(",").strip
    #     binding.pry
    #     print_array = self.cap_countries.filter {|country| country.start_with?(string)}.sort.uniq
    #     print_array.each_with_index{|country, i| puts "#{i + 1}. #{country}"}
    # end
  
    def self.print_station_user_choice(country_choice)
        matching_countries = Radio.all.select {|station| station.country == country_choice}
        matching_countries.each.with_index(1) do |station, i|
            puts ""
            puts Rainbow("#{station.name.upcase}").yellow.bright.underline  
            puts "#{i}. Station name: #{station.name}" unless station.name == ""
            puts "   State: #{station.state}" unless station.state == ""
            puts "   Country Code: #{station.country_code}" unless station.country_code == ""
            puts "   Tags: #{station.tags}" unless station.tags == ""
            puts ""
        end
    end

 
   

end

