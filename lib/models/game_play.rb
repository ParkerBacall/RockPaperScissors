require_relative 'cli'

class GamePlay #< ActiveRecord::Base
    attr_reader :user_move, :computer_move, :user_name

    def initialize user_name, user_move
        @user_move = user_move
        @computer_move = computer_move
        @user_name = user_name
      end
    
      def computer_move
        moves = ["rock", "paper", "scissors"]
        moves.sample
      end
    
      def game
        if @user_move == @computer_move
			puts "The computer also played #{@computer_move} It's a tie!"
		elsif @user_move == "rock" && @computer_move == "scissors"
			puts "The computer played scissors. You win #{@user_bane}!"
		elsif @user_move == "scissors" && @computer_move == "paper"
			puts "The computer played paper. You win #{@user_bane}!"
		elsif @user_move == "paper" && @computer_move == "rock"
			puts "The computer played rock. You win #{@user_bane}!"
		else 
			puts "The computer played #{@computer_move}. You lose #{@user_bane}."
        end
    end
end
