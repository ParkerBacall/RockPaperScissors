class Stats

    def stats_menu prompt = TTY::Prompt.new
        puts "\n"
        user_input = prompt.select( "Stats" "\n",["All Users", "All Games", "Global Wins","Global Losses", "Global Ties", "Global Win/Loss Ratio", "Back"])
        if user_input == "All Users"
            puts User.all.map {|user| user.name}
      
        elsif user_input == "All Games"
            puts Game.all
        elsif user_input == "Global Wins"
             puts Game.all.select{|game| game.status == "win"}.length
        elsif user_input == "Global Losses" 
            puts Game.all.select{|game| game.status == "lose"}.length
        elsif user_input == "Global Ties"  
            puts Game.all.select{|game| game.status == "tie"}.length
        elsif user_input == "Global Win/Loss Ratio"  
                puts (Game.all.select{|game| game.status == "win"}.length/ (Game.all.select{|game| game.status == "win"}.length + Game.all.select{|game| game.status == "lose"}.length).to_f).round(2)
        elsif user_input == "Back"
            Start.new.main
        end
        stats_menu
    end
end


