# BOT CONTROLLER
def check_game_position_sides(game_position)
  if game_position[2] == "X"
    return true
  elsif game_position[4] == "X"
    return true
  elsif game_position[6] == "X"
    return true
  elsif game_position[8] == "X"
    return true
  else
    return false
  end
end

def bot_make_decision(game_moves, game_position)
    starting_strat = Array[1, 3, 5]

    move = 1

    if game_moves == 0 # starting move
        move = starting_strat[0]

        return move
    elsif game_moves == 1
        if game_position[5] == " "
            if game_position[3] == " "
                move = 3

                return move
            elsif game_position[3] == "X" && game_position[7] == " "
                move = 7

                return move
            elsif game_position[3] == "X" && game_position[7] == "X" && game_position[9] = " "
                move = 7

                return move
            end
        end
    elsif game_moves == 2
        if game_position[2] == " "
            if game_position[3] == "O"
                move = 2

                return move
            end
            if game_position[7] == "O"
                move = 4

                return move
            end
        end
    end
end