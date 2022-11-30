# frozen_string_literal: true

# namespace for everthing displayed to user
module Display
  # mixin for messages sent to user
  module Messages
    def self.included(_base)
      include Conversions
    end

    def print_welcome_message
      puts 'Welcome to chess!'
      print_spacer
      puts "Chess is a two-player turn-based board game. Each turn, a player can move one piece of their color. A player wins by putting their oponent's king in check mate."
      print_spacer
      puts "Let's play!"
    end

    def print_player_name_prompt(player_number)
      2.times { print_spacer }
      puts "Player #{player_number}, what's your name?"
    end

    def print_player_name_warning
      print_spacer
      puts 'Please try again. Enter letters and numbers only.'
    end

    def print_piece_to_move_input(player)
      print_spacer
      puts "#{player.name}, what piece do you want to move (you are #{player.color})"
    end

    def print_invalid_input_warning
      print_spacer
      puts 'Please try again. Enter a letter A-H, then a number 1-8.'
    end

    def print_no_available_moves_warning
      print_spacer
      puts 'This piece has no available moves. Please enter a different piece.'
    end

    def print_invalid_piece_warning
      print_spacer
      puts 'Please try again. You must select a square that has your piece.'
    end

    def print_piece_destination_input(piece, valid_moves)
      chess_notation_valid_moves = valid_moves.map { |move_array_notation| chess_notation(move_array_notation) }
      print_spacer
      puts "Where do you want to move your #{piece.name} to? Valid moves = #{chess_notation_valid_moves.join(', ')} (marked with \e[31m\u25CF\e[0m above)"
    end

    def print_invalid_destination_warning
      puts 'Please try again. This piece cannot move to the destination you entered.'
    end

    def print_king_in_check_message(player_name)
      print_spacer
      puts "\e[31mWarning:\e[0m #{player_name} your king is in check. Your next move must protect your king!"
    end

    def print_game_winner_message(losing_player, winning_player)
      2.times { print_spacer }
      puts 'GAME OVER!'.green
      print_spacer
      puts "#{losing_player.name} your king is in check mate, you lose. So congrats #{winning_player.name}, you've won! You're so amaaazin!"
    end

    def print_play_again_message
      print_spacer
      puts 'Want to play again? Enter Y/N.'
    end

    def print_play_again_warning
      puts 'Please try again. Enter Y or N.'
    end

    def print_loading_board_message
      print_spacer
      puts 'Loading board...'
    end

    def print_spacer
      puts
    end
  end
end
