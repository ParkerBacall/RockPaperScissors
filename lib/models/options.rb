class Options

    def initialize 
        @user_array = User.all.map {|user| user.name}
    end

    def options_menu prompt = TTY::Prompt.new
        puts "\n"
        user_input = prompt.select( "Options" "\n",["Delete User", "Delete User Stats", "Back"])
            if user_input == "Delete User"
                user_name = prompt.select("Please select from existing user or enter new username:" "\n",  @user_array )
                    User.where(name: user_name).destroy_all
                    puts "#{user_name} has been deleted."
                    Start.new.main
            elsif user_input == "Delete User Stats"
                user_name = prompt.select("Please select from existing user or enter new username:" "\n",  @user_array )
                    selected_user_id = User.where(name: user_name)[0].id
                    Game.where(user_id: selected_user_id).destroy_all
                    puts "All of #{user_name}'s has been deleted."
                    Start.new.main
            elsif user_input == "Back"
                Start.new.main 
            end
    end
    
end