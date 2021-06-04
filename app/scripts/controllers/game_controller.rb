#imports
require_relative('.config/launcher.rb')

# THIS FILE WILL CONTAIN GAME STARTER FUNCTIONS
def display_game_status(game_display_data)
    puts "#{game_display_data[1]} |" +  " #{game_display_data[2]} |" +  " #{game_display_data[3]}"
    puts separator = "-----------"
    puts "#{game_display_data[4]} |" +  " #{game_display_data[5]} |" +  " #{game_display_data[6]}"
    puts separator
    puts "#{game_display_data[7]} |" +  " #{game_display_data[8]} |" +  " #{game_display_data[9]}"
end

def ask_player_for_input(game_display_data)
    display_game_status(game_display_data) # display game_position first

    puts "Type a move(Refer to README.md to check how):"
    input = gets.chomp

    chars_move = 0
    first_char = " "
    second_char = " "

    first_row = [1, 2, 3]
    second_row = [4, 5, 6]
    third_row = [7, 8, 9]

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
            return
        else
            puts "Invalid Input!"
            return
        end
    end

    if first_char == "a"
        return first_row[second_char.to_i - 1]
    elsif first_char == "b"
        return second_row[second_char.to_i - 1]
    elsif first_char == "c"
        return third_row[second_char.to_i - 1]
    end
end