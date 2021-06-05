# Program made by RespectedCow on github

#imports
require_relative('app/scripts/controllers/game_controller.rb')
require_relative('app/scripts/controllers/bot_controller.rb')

#variables
player_turn_place = "X"
bot_turn_place = "O"

#functions
def ask_player_restart
    puts "Do you wanna exit the file or restart?(y for exit/n for restart)"
    player_input = gets.chomp

    if player_input == "y"
        exit
    elsif player_input == "n"
        game_start()
    else
        exit
    end
end

def game_start
    # create the values
    game_position = Array[" ", " ", " ", " ", " ", " "," ", " ", " "]

    game_turn = "BOT"

    game_moves = 0

    #main
    bot_move(game_moves, game_position)
end

game_start()