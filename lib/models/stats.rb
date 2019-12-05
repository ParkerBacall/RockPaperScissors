class Stats

    def initialize
        @user_array = User.all.map {|user| user.name}
    end

def stats_menu prompt = TTY::Prompt.new
        puts "\n"
        user_input = prompt.select( "Select user or global stats?" "\n",["User stats", "Global Stats"])
        if user_input == "User stats"
            user_stats_menu
        else
            global_stats_menu
    end
end

def user_stats_menu prompt = TTY::Prompt.new
    puts "\n"
        user_input = prompt.select( "Select a user" "\n",[@user_array])
end

    def global_stats_menu prompt = TTY::Prompt.new
        puts "\n"
        user_input = prompt.select( "Stats" "\n",["Global Wins","Global Losses", "Global Win/Loss Ratio", "Back"])
        if user_input == "Global Wins"
             puts Game.all.select{|game| game.status == "win"}.length
        elsif user_input == "Global Losses" 
            puts Game.all.select{|game| game.status == "lose"}.length
        elsif user_input == "Global Win/Loss Ratio"  
                puts (Game.all.select{|game| game.status == "win"}.length/ (Game.all.select{|game| game.status == "win"}.length + Game.all.select{|game| game.status == "lose"}.length).to_f).round(2)
        elsif user_input == "Back"
            Start.new.main
        end
        global_stats_menu
    end
end


