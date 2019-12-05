class Start
    
    def main prompt = TTY::Prompt.new
        
        puts "\n"
        user_input = prompt.select( "Welcome to Rock, Paper, Scissors!" "\n", ["Play Game", "See Stats", "Quit"])
        choice(user_input)
    end


    def choice user_input
      
        if user_input.downcase == 'play game'
            cli = Cli.new
            cli.select_user_name
        elsif user_input.downcase == 'see stats'
            Stats.new.stats_menu
        elsif user_input.downcase == 'quit'
            puts "\n"
            exit
            puts "\n"
        end    
    end

end