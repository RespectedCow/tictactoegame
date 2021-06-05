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

def winning_position(game_position, move_char)
    if game_position[1] == move_char && game_position[2] == move_char && game_position[3] == move_char
        return true
    elsif game_position[4] == move_char && game_position[5] == move_char && game_position[6] == move_char
        return true
    elsif game_position[7] == move_char && game_position[8] == move_char && game_position[9] == move_char
        return true
    elsif game_position[1] == move_char && game_position[4] == move_char && game_position[7] == move_char
        return true
    elsif game_position[2] == move_char && game_position[5] == move_char && game_position[8] == move_char
        return true
    elsif game_position[3] == move_char && game_position[6] == move_char && game_position[9] == move_char
        return true
    elsif game_position[1] == move_char && game_position[5] == move_char && game_position[9] == move_char
        return true
    elsif game_position[3] == move_char && game_position[5] == move_char && game_position[7] == move_char
        return true
    end
end  

def bot_make_decision(game_moves, game_position)
    #starting_strat = Array[1, 3, 5]

    #move = 1

    #if game_moves == 0 # starting move
    #    move = starting_strat[0]

    #    return move
    #elsif game_moves == 1
    #    if game_position[5] == " "
    #        if game_position[3] == " "
    #            move = 3
    #
    #            return move
    #        elsif game_position[3] == "X" && game_position[7] == " "
    #            move = 7

    #            return move
    #        elsif game_position[3] == "X" && game_position[7] == "X" && game_position[9] = " "
    #            move = 7

    #           return move
    #        end
    #    end
    #elsif game_moves == 2
    #    if game_position[2 - 1] == " "
    #        if game_position[3 - 1] == "O"
    #            move = 2 - 1
    #
    #            return move
    #        end
    #        if game_position[7 - 1] == "O"
    #            move = 4 - 1
    #
    #            return move
    #        end
    #    end
    #end

    #Bot code here ,code from https://medium.com/analytics-vidhya/how-i-built-an-unbeatable-ai-algorithm-for-tic-tac-toe-game-in-ruby-26d8c2f43e52
    possible_moves = []
    game_position.each_with_index do |i,j|
      possible_moves << j if i == ' ' && j != 0
    end
    make_move = 0

    %w[X O].each do |marker|
        possible_moves.each do |moves|
          game_position_copy = game_position.dup
          game_position_copy[moves] = marker
          if winning_position(game_position_copy, marker)
            make_move = moves
            puts make_move
            return make_move
          end
        end
    end

    
    corner_moves = []
    possible_moves.each do |moves|
        corner_moves << moves if [1, 3, 7, 9].include? moves
    end

    if corner_moves.length.positive?
        random_corner = corner_moves.sample
        make_move = 
            if possible_moves.include? 5
                [random_corner, 5].sample
            else
                random_corner
            end
        return make_move
    end
    
    edges_moves = []
    possible_moves.each do |moves|
        edges_moves << moves if [2, 4, 6, 8].include? moves
    end

    if edges_moves.length.positive?
        random_edges = edges_moves.sample
        make_move = if possible_moves.include? 5
                        [random_edges, 5].sample
                    else
                        random_edges
                    end
        return make_move
    end
end