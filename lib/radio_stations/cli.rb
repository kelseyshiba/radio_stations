class RadioStations
    
    def start
        puts Rainbow("WELCOME TO RADIO STATIONS SELECT!").green.bright.underline
        Scraper.grab_stations
        self.menu
    end

    def menu #ALPHATEICAL ROUTE A1 #ADD VIEW LIST?!
        puts ""
        puts Rainbow("Please pick a range for the first letter of the country you want to view or type 'all' to see all countries").yellow
        puts Rainbow("Type 'list' to see your saved stations").yellow
        puts Rainbow("Type 'exit' to end program").yellow
        puts "----------      ----------      ----------      ----------      ----------      ----------"
        puts Rainbow(" 1. A-F           2. G-L          3.M-R           4. S-Z            ALL            LIST").green
        puts "----------      ----------      ----------      ----------      ----------      ----------"
        input = gets.strip.downcase
        until input =='all' || input.to_i.between?(1,4) || input == 'list' || input == 'exit'
            puts Rainbow("Please enter a valid input (1-4 or all)").red
            input = gets.strip.downcase
        end
        if input == 'all'
            self.list_stations_by_country
        elsif input == 'list'
            Radio.my_list.each do |station|
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
            self.menu
        elsif input == "1"       
            @A_to_F = Radio.cap_countries.filter {|country| country.start_with?("A", "B", "C", "D", "E", "F")}.sort.uniq
            @A_to_F.each_with_index {|country, i| puts "#{i + 1}. #{country}"}
            self.select_by_letter(@A_to_F)
        elsif input == "2"
            @G_to_L = Radio.cap_countries.filter {|country| country.start_with?("G", "H", "I", "J", "K", "L")}.sort.uniq
            @G_to_L.each_with_index {|country, i| puts "#{i + 1}. #{country}"}
            self.select_by_letter(@G_to_L)
        elsif input == "3"
            @M_to_R = Radio.cap_countries.filter {|country| country.start_with?("M", "N", "O", "P", "Q", "R")}.sort.uniq
            @M_to_R.each_with_index {|country, i| puts "#{i + 1}. #{country}"}
            self.select_by_letter(@M_to_R)
        elsif input == "4"
            @S_to_Z = Radio.cap_countries.filter {|country| country.start_with?("S", "T", "U", "V", "W", "X")}.sort.uniq
            @S_to_Z.each_with_index {|country, i| puts "#{i + 1}. #{country}"}
            self.select_by_letter(@S_to_Z)
        elsif input == 'exit'
            self.end_program
        end
    end
    
    def select_by_letter(array) #ROUTE A2 
        puts ""
        puts Rainbow("Pick a country by number:").yellow
        input = gets.strip.to_i
        until input.between?(1,array.length) 
            puts Rainbow("Please enter a valid number").red
            input = gets.strip.to_i 
        end
        index = input.to_i - 1
        i = 1
        user_choice = Radio.all.select do |station|
            if station.country == array[index]
                puts ""
                puts Rainbow("#{station.name.upcase}").green.bright.underline  
                puts "#{i}. Station name: #{station.name}" unless station.name == ""
                puts "   State: #{station.state}" unless station.state == ""
                puts "   Country Code: #{station.country_code}" unless station.country_code == ""
                puts "   Tags: #{station.tags}" unless station.tags == ""
                puts ""
                i += 1
                # user_choice << station
            end
        end
        self.ask_more_info(user_choice)
    end
    #================================================================
    def list_stations_by_country #ROUTE B1
        puts Rainbow("What country's radio stations would you like to explore?").yellow
        sleep(2)
        uniq_countries = Radio.cap_countries.sort {|a,b| a <=> b}.uniq
        uniq_countries.filter {|country| country !=""}
        uniq_countries.each_with_index {|country, i| puts "#{i}. #{country}" if country != ""}
        self.ask_user_for_country(uniq_countries)
    end

    def ask_user_for_country(array) #ROUTE B2
        puts ""
        puts Rainbow("Pick a country by entering the number:").yellow
        index = gets.strip.to_i
        until index.between?(1,array.length)
            puts Rainbow("Invalid input. Please select a valid number").red
            index = gets.strip.to_i
        end
        user_country_choice = array[index]
        puts ""
        puts Rainbow("You've selected #{user_country_choice.upcase}!").green
        self.list_stations_by_selection(user_country_choice)
    end


    def list_stations_by_selection(choice) #ROUTE B3
        # stations_by_country = []
        i = 1

        stations_by_country = Radio.all.select do |station| 
            if station.country.split.map(&:capitalize).join(' ') == choice
                puts ""
                puts Rainbow("#{station.name.upcase}").yellow.bright.underline  
                puts "#{i}. Station name: #{station.name}" unless station.name == ""
                puts "   State: #{station.state}" unless station.state == ""
                puts "   Country Code: #{station.country_code}" unless station.country_code == ""
                puts "   Tags: #{station.tags}" unless station.tags == ""
                puts ""
                # stations_by_country << station
                i += 1
            end
        end
        self.ask_more_info(stations_by_country)
    end
#========================================================================================
    def ask_more_info(array) #ROUTE A3 OR ROUTE B4
        puts Rainbow("Enter the number if you would like more information or type 'back' to start again or type 'exit'.").yellow
        input = gets.strip.downcase
        until input == 'back' || input == 'exit' || input.to_i.between?(1, array.length)
            puts Rainbow("Please enter a valid input (number, back, or exit).").red
            input = gets.strip.downcase
        end
        if input == "back"
            self.menu
        elsif input == 'exit'
            self.end_program
        else
            self.display_more_info(input, array)
        end  
    end

    def display_more_info(input, array) #ROUTE A4 OR ROUTE B5
       #array = all radio stations from the country I selected, input is the number I entered
        index = input.to_i - 1
        
        station_choice = [] #this was not working as collect/select?

        Radio.all.each do |station| 
            if station.name == array[index].name
                puts Rainbow("STATION NAME: #{station.name.upcase}").green.underline if station.name !=""
                puts ""
                puts "Station URL: #{station.url}" if station.url !="" 
                puts "Station votes: #{station.votes}" if station.votes !="" && station.votes != 0 
                puts ""
                station_choice << station
            end
        end
        # station_choice.uniq
        self.ask_four_choices(station_choice.uniq)
    end

    def ask_four_choices(array)
        puts Rainbow("Would you like to: 
                        Open the url                    type: 'open'
                        Add this station to your list   type: 'add'
                        Start over                      type: 'start'
                        Exit                            type:  'exit'").yellow
        input = gets.strip.downcase
        until input == 'open' || input == 'add' || input == 'start' || input == 'exit'
            puts Rainbow("Please enter a valid input (open, list, start or exit)").red
            input = gets.strip.downcase
        end
        if input == 'open'        
            url = array.each {|station| station.url}
            self.open_url(url)
        elsif input == 'add'
            array.each {|station| station.add_station(station)}
            puts ""
            puts "This station has been added to your list!"
            puts ""
            Radio.my_list.each do |station|
                puts Rainbow("Station Name: #{station.name}").green
                puts "Station URL: #{station.url}"
                puts "Station Country: #{station.country}"
                puts "Tags: #{station.tags}"
                puts "Votes: #{station.votes}"
                puts ""
            end
            puts ""
            self.ask_user_select_again
        elsif input == 'start'
            self.menu
        else
            self.end_program
        end
    end
    
    def open_url(url) #ROUTE A5 OR ROUTE B6
        puts Rainbow("Would you like to open the website? Y/N").yellow
        input = gets.strip.downcase
        until input == 'n' || input == 'y'
            puts Rainbow("Please enter 'y' for yes or 'n' for no.").red
            input = gets.strip
        end
        if input == 'y'
            Radio.all.each do |station|
                if station.url == url
                    Launchy.open(station.url)
                end
            end
            self.ask_user_select_again
        elsif input == 'n'
            self.ask_user_select_again
        end
    end
#=============================== WISH LIST SECTION =============================
    # def ask_add_to_my_list
    #     puts Rainbow("Would you like to add this station to your list? (Y/N)").yellow
    #     input = gets.strip.downcase
    #     until input == 'y' || input == 'n'
    #         puts Rainbow("Please enter Y for yes or N for No").red
    #         input = gets.strip.downcase
    #     end
    #     if input == 'y'
    #         puts Rainbow("This station has been added to your list!").green
    #         self.my_list
    #     elsif input == 'n'
    #         self.ask_user_select_again
    #     end
    # end

    # def my_list(objects_array)
    #     puts Rainbow("Would you like to view your list? (Y/N)").yellow
    #     input = gets.strip.downcase
    #     until input == 'y' || input == 'n'
    #         puts Rainbow("Please enter a valid input Y for Yes or N for No.").red
    #         input = gets.strip.downcase
    #     end
    #     if input == 'y'
    #         # self.view_list
    #         objects_array.sort_by {|station| puts "#{station.name}"}
    #     elsif input == 'n'
    #         self.ask_user_select_again
    #     end
    # end

    # def view_list
    #     puts "Here is your list"
    #     self.ask_user_select_again
    # end
    
    #================================= USER SELECT AGAIN =======================

    def ask_user_select_again      #ROUTE A6 OR B7
        puts Rainbow("Would you like to select another country? If yes, enter 'y' or enter 'exit' to exit").yellow
        input = gets.strip.downcase
        until input == 'y' || input == "exit"
            puts Rainbow("Please enter a valid input ('y' or 'exit').").red
            input = gets.strip.downcase
        end 
        if input == 'y'
            self.menu
        elsif input == "exit"
            self.end_program
        end
    end
    #===================================== END PROGRAM ==============================================
    def end_program
        puts Rainbow("THANKS FOR VISITING!").green.bright
        sleep(1)
        puts ""
        puts Rainbow("G O O D   B Y E!").red
        puts ""
    end

end
