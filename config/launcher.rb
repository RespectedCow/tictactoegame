# Program made by RespectedCow on github

#imports
require_relative('/app/scripts/controllers/game_controller.rb')
require_relative('/app/scripts/controllers/game_controller.rb')

#variables
player_turn_place = "X"
bot_turn_place = "O"

#functions
def ask_player_restart
    puts "Do you wanna exit the file or restart?(y/n)"
    player_input = gets.chomp

    if player_input == "y"
        game_start()
    elsif player_input == "n"
        exit
    else
        exit
    end
end

def game_start
    # create the values
    game_position = Array[" ", " ", " ",
                              " ", " ", " ",
                              " ", " ", " "]

    game_turn = "BOT"

    game_moves = 0

    #main
    id = ask_player_for_input(game_position)
    if id.nil?
        ask_player_restart()
    end
end

game_start()