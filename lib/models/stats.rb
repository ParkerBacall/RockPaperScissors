class Stats

    def initialize
        @user_array = User.all.map {|user| user.name}
    end

def stats_menu prompt = TTY::Prompt.new
        puts "\n"
        user_input = prompt.select( "Select user or global stats?" "\n",["User stats", "Global Stats", "Back"])
        if user_input == "User stats"
            user_stats_menu
        elsif user_input == "Global Stats"
            global_stats_menu
        else 
            Start.new.main
    end
end

def user_stats_menu prompt = TTY::Prompt.new
    puts "\n"
        user_name = prompt.select( "Select a user" "\n",[@user_array , "Back"])
        if user_name == "Back"
            stats_menu
        else
        inner_user_menu(user_name)
        end
end

 def inner_user_menu user_name, prompt = TTY::Prompt.new
        user_input = prompt.select( "Select a stat" "\n",["#{user_name}'s number of games", "#{user_name}'s Wins, Loses, Ties", "#{user_name}'s Win/Loss Ratio", "#{user_name}'s Throws", "Back"])
   
        user_games = User.all.find{|user| user.name == user_name }.games
        user_wins = user_games.select {|game| game.status == "win"}.length
        user_loses = user_games.select {|game| game.status == "lose"}.length
        user_ties = user_games.select {|game| game.status == "tie"}.length
        user_rock =  user_games.select {|game| game.call == "Rock"}.length
        user_paper =  user_games.select {|game| game.call == "Paper"}.length
        user_scissors =  user_games.select {|game| game.call == "Scissors"}.length

        if user_input == "#{user_name}'s number of games"
            puts User.all.find{|user| user.name == user_name }.games.length
        elsif user_input == "#{user_name}'s Wins, Loses, Ties"
           puts "Wins:" + " #{user_wins}".green + " Loses:" + " #{user_loses}".red + " Ties:" + " #{user_ties}".yellow
        elsif user_input == "#{user_name}'s Win/Loss Ratio"
            puts (user_wins/ (user_wins + user_loses).to_f).round(2)
        elsif user_input == "#{user_name}'s Throws"
            puts "Rock: #{user_rock} Paper: #{user_paper} Scissors: #{user_scissors}"
        elsif user_input == "Back"
            user_stats_menu
        end
        inner_user_menu(user_name)
    end


    def global_stats_menu prompt = TTY::Prompt.new

        global_wins = Game.all.select{|game| game.status == "win"}.length
        global_losses = Game.all.select{|game| game.status == "lose"}.length
        global_ties = Game.all.select{|game| game.status == "tie"}.length
        global_rock =  Game.all.select {|game| game.call == "Rock"}.length
        global_scissors =  Game.all.select {|game| game.call == "Scissors"}.length
        global_paper =  Game.all.select {|game| game.call == "Paper"}.length
        global_computer_rock =  Game.all.select {|game| game.computer_call == "rock"}.length
        global_computer_scissors =  Game.all.select {|game| game.computer_call == "scissors"}.length
        global_computer_paper =  Game.all.select {|game| game.computer_call == "paper"}.length

        puts "\n"
        user_input = prompt.select( "Stats" "\n",["Global Total Games", "Global Wins, Losses, Ties", "Global Win/Loss Ratio", "Global Player Throws", "Global Computer Throws",  "Back"])
        if user_input == "Global Total Games"
            puts Game.all.length
        elsif user_input == "Global Wins, Losses, Ties"
             puts "Wins:" + " #{global_wins}".green + " Loses:" + " #{global_losses}".red + " Ties:" + " #{global_ties}".yellow
        elsif user_input == "Global Player Throws"
            puts "Rock: #{global_rock} Paper: #{global_paper} Scissors: #{global_scissors}"
        elsif user_input == "Global Computer Throws"
            puts "Rock: #{global_computer_rock} Paper: #{global_computer_paper} Scissors: #{global_computer_scissors}"
        elsif user_input == "Global Win/Loss Ratio"  
                puts (Game.all.select{|game| game.status == "win"}.length/ (Game.all.select{|game| game.status == "win"}.length + Game.all.select{|game| game.status == "lose"}.length).to_f).round(2)
        else
            stats_menu
        end
        global_stats_menu
    end
end


