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
            puts "Error, try again (check your spelling)"
            puts ""   
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
        @user_move = gets.chomp
        self.game_start
    end  
    
    def game_start
        if @user_move.downcase == 'rock' || @user_move.downcase == 'paper' || @user_move.downcase == 'scissors' 
            start = GamePlay.new(@user_name, @user_move)
            start.game
        else 
            puts "Error, try again (check your spelling)"
            puts ""
            self.select_move
        end
    end



    def stats_menu
        #retrive stats
    end

end