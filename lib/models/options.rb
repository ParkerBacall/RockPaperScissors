class Options

    def options_menu prompt = TTY::Prompt.new
        puts "\n"
        user_input = prompt.select( "Options" "\n",["Delete User", "Delete User Stats", "Back"])
            if user_input == "Delete User"

            elsif user_input = "Delete User Stats"
                
            elsif user_input == "Back"
                Start.new.main
            end
    end
    
end