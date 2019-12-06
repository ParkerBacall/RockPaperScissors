require_relative 'game_play'

class Cli #< ActiveRecord::Base
    attr_reader :user_name
    
    def initialize user_name = nil
        @user_name = user_name
        @user_array = User.all.map {|user| user.name}
    end

    def existing_user_or_new prompt = TTY::Prompt.new
        if @user_array.empty?
            enter_user_name
        else
            user_input = prompt.select("New or returning user?" "\n", ["Existing User", "New User"])
                if user_input == "Existing User"
                    select_user_name
                else
                    enter_user_name
                end
        end
    end


    def select_user_name prompt = TTY::Prompt.new
        user_name = prompt.select("Please select from existing user or enter new username:" "\n",  @user_array, "Back" )
        @user_name = User.all.find{|user|user.name == user_name}
        if user_name == "Back"
            existing_user_or_new
        elsif
        select_move
        end
    end

    def enter_user_name
        puts "\n"
        puts "Enter Username:"
        puts "\n"
        user_name = gets.chomp.capitalize()
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
        move_array = ["Rock", "Paper","Scissors"]

        @user_move = prompt.select( "Please select your move:" "\n", move_array.shuffle)
       
        game_start
    end  
    
    def game_start
        puts "\n"
        if @user_move.downcase == 'rock' || @user_move.downcase == 'paper' || @user_move.downcase == 'scissors' 
            start = GamePlay.new(@user_name, @user_move)
            start.game
        end
        play_again
    end

    def play_again prompt = TTY::Prompt.new
        puts "\n"
        user_input = prompt.select( "Would you like to play again?" "\n",["Yes", "No"])

        if  user_input.downcase == 'yes'
                puts "\n"
                select_move
        elsif 
            user_input.downcase == 'no'
                puts "\n"
                Start.new.main
                puts "\n"
        end
    end


end