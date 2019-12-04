require_relative 'game_play'

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
            self.enter_user_name
        elsif user_input.downcase == 'see stats'
            self.stats_menu
        else
            puts "Error, try again (check your spelling):"
            self.main
        end
    end

    def enter_user_name
        puts "\n"
        puts "Enter Username"
        puts "\n"
        @user_name = gets.chomp
        puts "\n"
        puts "hello #{@user_name}!"
        puts ""
        self.select_move
    end

    def select_move
        puts "\n"
        puts "Please select your move. Type rock, paper, or scissors:"
        puts "\n"
        @user_move = gets.chomp
        self.game_start
    end  
    
    def game_start
        puts "\n"
        if @user_move.downcase == 'rock' || @user_move.downcase == 'paper' || @user_move.downcase == 'scissors' 
            start = GamePlay.new(@user_name, @user_move)
            start.game
        else 
            puts "Error, try again (check your spelling)"
            puts ""
            self.select_move
        end
        self.play_again
    end

    def play_again
        puts "\n"
        puts "Would you like to play again? Type yes or no:"
        user_input = gets.chomp
        if  user_input.downcase == 'yes'
                puts "\n"
                self.select_move
        elsif 
            user_input.downcase == 'no'
                puts "\n"
                puts "Thank you for playing! Be sure to check out your all-time stats:"
                self.main
        else 
            user_input.downcase != "no" && user_input.downcase != "yes"
                puts "\n"
                "Check your spelling and try again. Type yes or no:"
                puts "\n"
                self.play_again
        end
    end


    def stats_menu
        #retrive stats
    end

end