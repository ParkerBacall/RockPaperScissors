require_relative 'cli'

class GamePlay #< ActiveRecord::Base
    attr_reader :user_move, :computer_move, :user_name, :status

    def initialize user_name, user_move
        @user_move = user_move
        @computer_move = computer_move
        @user_name = user_name
        @status = status
      end
    
      def computer_move
        moves = ["rock", "paper", "scissors"]
        moves.sample
      end
    
    def game
        if @user_move.downcase == @computer_move
            puts "The computer also played #{@computer_move} It's a tie!"
            puts "\n"
            @status = 'tie'
		elsif @user_move.downcase == "rock" && @computer_move == "scissors"
      puts "The computer played scissors. You win !"
      puts "\n"
        @status = 'win'
		elsif @user_move.downcase == "scissors" && @computer_move == "paper"
      puts "The computer played paper. You win!"
      @status = 'win'
		elsif @user_move.downcase == "paper" && @computer_move == "rock"
      puts "The computer played rock. You win!" 
      puts "\n"
      @status = 'win'
		else 
      puts "The computer played #{@computer_move}. You lose 😢."
      puts "\n"
      @status = 'lose'
        end
        Game.create(status: @status, user: @user_name, computer_call: @computer_move, call: @user_move)
    
    end


end
