class Stats

    def stats_menu prompt = TTY::Prompt.new
        puts "\n"
        user_input = prompt.select( "Stats" "\n",["All Users", "All Games", "Global Wins", "Wins/Loss Ratio",  "Back"])
        if user_input == "All Users"
            puts User.all.map {|user| user.name}
      
        elsif user_input == "All Games"
            puts Game.all
        elsif user_input == "Global Wins"
            puts Game.all.select{|game| game.status == "win"}.length
        elsif user_input == "Wins/Loss Ratio"  
            puts ((Game.all.select{|game| game.status == "win"}.length)/(Game.all.length.to_f)).round(2)
        elsif user_input == "Back"
            Start.new.main
        end
        stats_menu
    end

end