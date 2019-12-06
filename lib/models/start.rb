class Start
    
def main prompt = TTY::Prompt.new
        
puts <<-'EOF'.green

 ____                    __          ____                                  
/\  _`\                 /\ \        /\  _`\                                
\ \ \L\ \    ___     ___\ \ \/'\    \ \ \L\ \ __     _____      __   _ __  
 \ \ ,  /   / __`\  /'___\ \ , <     \ \ ,__/'__`\  /\ '__`\  /'__`\/\`'__\
  \ \ \\ \ /\ \L\ \/\ \__/\ \ \\`\    \ \ \/\ \L\.\_\ \ \L\ \/\  __/\ \ \/ 
   \ \_\ \_\ \____/\ \____\\ \_\ \_\   \ \_\ \__/.\_\\ \ ,__/\ \____\\ \_\ 
    \/_/\/ /\/___/  \/____/ \/_/\/_/    \/_/\/__/\/_/ \ \ \/  \/____/ \/_/ 
                                                       \ \_\               
                                                        \/_/               
 ____                                                       
/\  _`\           __                                        
\ \,\L\_\    ___ /\_\    ____    ____    ___   _ __   ____  
 \/_\__ \   /'___\/\ \  /',__\  /',__\  / __`\/\`'__\/',__\ 
   /\ \L\ \/\ \__/\ \ \/\__, `\/\__, `\/\ \L\ \ \ \//\__, `\
   \ `\____\ \____\\ \_\/\____/\/\____/\ \____/\ \_\\/\____/
    \/_____/\/____/ \/_/\/___/  \/___/  \/___/  \/_/ \/___/
    
    A useless game developed by Parker Bacall and Sam Hoidal.
    EOF

        user_input = prompt.select( "\n", ["Play Game", "See Stats", "Options", "Quit"])
        choice(user_input)
    end


    def choice user_input
      
        if user_input.downcase == 'play game'
            cli = Cli.new
            cli.existing_user_or_new 
        elsif user_input.downcase == 'see stats'
            Stats.new.stats_menu
        elsif user_input.downcase == 'options'
            Options.new.options_menu
        elsif user_input.downcase == 'quit'
            puts "\n"
            system("clear")
            exit
            puts "\n"
        end    
    end

end
