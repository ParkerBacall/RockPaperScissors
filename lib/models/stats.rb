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

def enter_user_name
    puts "\n"
    puts "Enter Username:"
    puts "\n"
    user_name = gets.chomp
    puts "\n"
    if @user_array.include?(user_name)
        puts "Username already taken. Please select again:"
        enter_user_name
    else 
        @user_name = User.create(name: user_name)
        puts "hello #{user_name}!"
        puts ""
        select_move
    end
end

def select_move prompt = TTY::Prompt.new
    
    @user_move = prompt.select( "Please select your move:" "\n",["Rock", "Paper","Scissors"])
   
    game_start
end  
