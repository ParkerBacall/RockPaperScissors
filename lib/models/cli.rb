class Cli #< ActiveRecord::Base
    attr_reader :user_name

    def initialize user_name = nil
        @user_name = user_name
    end

    def main
        puts "\n"
        puts "Rock, Paper, Scissors!"
        puts "\n"
        puts "play game"
        puts "\n"
        puts "stats"
        self.choice
    end


    def choice
        puts "\n"
        user_input = gets.chomp
        puts "\n"
        
        if user_input.downcase == 'play game'
            self.game_start
        elsif user_input.downcase == 'stats'
            self.stats_menu
        else
            puts "error, try again"
            puts ""   
    end
end

    def game_start
        puts "\n"
        puts "Enter Username"
        puts "\n"
        user_name = gets.chomp
        puts "\n"
        puts "Hello #{user_name}"
        @user_name = User.create(name: user_name)
        puts "\n"
        #game_play
    end

    def stats_menu
        #retrive stats
    end

end