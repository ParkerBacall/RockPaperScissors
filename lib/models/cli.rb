class Cli #< ActiveRecord::Base

    def main
        puts "\n"
        puts "Welcome to Rock, Paper, Scissors!"
        puts "\n"
        puts "Play Game"
        puts "\n"
        puts "See Stats"
        self.choice
    end


    def choice
        puts "\n"
        user_input = gets.chomp
        puts "\n"
        
        if user_input.downcase == 'play game'
            self.game_start
        elsif user_input.downcase == 'see stats'
            self.stats_menu
        else
            puts "Error, try again (check your spelling)"
            puts ""   
    end
end

    def game_start
        puts "\n"
        puts "Enter Username"
        puts "\n"
        @user_name = gets.chomp
        puts "\n"
        puts "Hello #{@user_name}"
        puts "\n"
        puts "Please select your move. Type rock, paper, or scissor:"
        @user_move = gets.chomp
        
        if @user_move.downcase == 'rock' || @user_move.downcase == 'paper' || @user_move.downcase == 'scissors' 
            GamePlay.new(@user_move)
        else 
            puts "Error, try again (check your spelling)"
            puts ""
        end
    end

    def stats_menu
        #retrive stats
    end

end