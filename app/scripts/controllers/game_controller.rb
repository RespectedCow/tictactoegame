#imports
require_relative 'bot_controller.rb'

# THIS FILE WILL CONTAIN GAME STARTER FUNCTIONS
def display_game_status(game_display_data)
    puts " #{game_display_data[1]} |" +  " #{game_display_data[2]} |" +  " #{game_display_data[3]}"
    puts separator = "-----------"
    puts " #{game_display_data[4]} |" +  " #{game_display_data[5]} |" +  " #{game_display_data[6]}"
    puts separator
    puts " #{game_display_data[7]} |" +  " #{game_display_data[8]} |" +  " #{game_display_data[9]}"
end

def tie(game_position)
    marked_position = 0

    game_position.each do |position|
        if position != " "
            marked_position += 1
        end
    end

    if marked_position != 9
        return false
    else
        return true
    end
end

def bot_place(id, game_position, game_moves)
    game_position[id] = "O"

    game_moves = game_moves + 1

    if winning_position(game_position, "O")
        display_game_status(game_position)
        puts "The computer won you loser!"
        exit
    end

    if tie(game_position)
        display_game_status(game_position)
        puts "It's a tie!"
        exit
    end

    ask_player_for_input(game_position, game_moves)
end

def player_place(id, game_position, move_char, game_moves)
    game_position[id] = move_char

    if winning_position(game_position, "X")
        display_game_status(game_position)
        puts "You won! Congrats!"
        exit
    end

    if tie(game_position)
        display_game_status(game_position)
        puts "It's a tie!"
        exit
    end

    bot_move(game_moves, game_position)
end

def bot_move(game_moves, game_position)
    decision = bot_make_decision(game_moves, game_position)

    if decision.nil?
        display_game_status(game_position)
        puts "You got a tie! Ending!"
        exit
    end
   
    bot_place(decision, game_position, game_moves)
end

def ask_player_for_input(game_display_data, game_moves)
    display_game_status(game_display_data) # display game_position first

    puts "Type a move(Refer to README.md to check how):"
    input = gets.chomp

    chars_move = 0
    first_char = " "
    second_char = " "

    first_row = [1, 2, 3]
    second_row = [4, 5, 6]
    third_row = [7, 8, 9]

    if input == "end"
        puts "Ending!"
        exit
    end

    input.chars.each do |char|
        if char == "a" && chars_move == 0
            chars_move = chars_move + 1
            first_char = "a"
        elsif char == "b" && chars_move == 0
            chars_move = chars_move + 1
            first_char = "b"
        elsif char == "c" && chars_move == 0
            chars_move = chars_move + 1
            first_char = "c"
        elsif char == "1" && chars_move == 1
            chars_move = chars_move + 1
            second_char = "1"
        elsif char == "2" && chars_move == 1
            chars_move = chars_move + 1
            second_char = "2"
        elsif char == "3" && chars_move == 1
            chars_move = chars_move + 1
            second_char = "3"
        elsif chars_move == 2
            puts "Invalid Input!"
            ask_player_for_input(game_display_data, game_moves)
        else
            puts "Invalid Input!"
            ask_player_for_input(game_display_data, game_moves)
        end
    end

    if first_char == "a"
        move = first_row[second_char.to_i - 1]

        if game_display_data[move] == " "
            player_place(move, game_display_data, "X", game_moves)
        else
            puts "Space Occupied"
            ask_player_for_input(game_display_data, game_moves)
        end
    elsif first_char == "b"
        move = second_row[second_char.to_i - 1]

        if game_display_data[move] == " "
            player_place(move, game_display_data, "X", game_moves)
        else
            puts "Space Occupied"
            ask_player_for_input(game_display_data, game_moves)
        end
    elsif first_char == "c"
        move = third_row[second_char.to_i - 1]

        if second_char == "3" && game_display_data[9] != "O"
            player_place(move, game_display_data, "X", game_moves)
            return
        elsif second_char == "3" && game_display_data[9] == "O"
            puts "Space Occupied!!!"
            ask_player_for_input(game_display_data, game_moves)
        elsif second_char == "1" && game_display_data[7] != "O"
            player_place(move, game_display_data, "X", game_moves)
            return
        elsif second_char == "1" && game_display_data[7] == "O"
            puts "Space Occupied!!!"
            ask_player_for_input(game_display_data, game_moves)
        elsif second_char == "2" && game_display_data[8] != "O"
            player_place(move, game_display_data, "X", game_moves)
            return
        elsif second_char == "2" && game_display_data[8] == "O"
            puts "Space Occupied!!!"
            ask_player_for_input(game_display_data, game_moves)
        end
    end
end