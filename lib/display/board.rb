# frozen_string_literal: true

# namespace for everthing displayed to user
module Display
  # mixin for displaying the board itself
  module Board
    def self.included(_base)
      include Display::Messages
    end

    def display
      # clear_screen
      print_letter_legend
      @data.each.with_index do |row, row_index|
        print_row_num_before(row_index)
        print_row(row, row_index)
        print_row_num_after(row_index)
      end
      print_letter_legend
    end

    private

    def clear_screen
      system 'clear'
    end

    def print_board_arr
      @data.each.with_index do |row, index|
        puts
        pieces_in_row = row.reject(&:nil?).count.positive?
        if pieces_in_row
          puts "--- ROW ##{index + 1} ---"
          row.each { |piece| print "#{piece.color} #{piece.name}, " }
        else
          puts
        end
      end
    end

    def print_row(row, row_index)
      row.each.with_index do |cell, cell_index|
        char = cell.char unless cell.nil?
        cell.nil? ? print_blank(row_index, cell_index) : print_char(row_index, cell_index, char)
      end
    end

    def print_char(row_index, cell_index, char)
      if row_index.odd?
        print cell_index.odd? ? " #{char} ".bg_blue : " #{char} ".bg_white
      else
        print cell_index.even? ? " #{char} ".bg_blue : " #{char} ".bg_white
      end
    end

    def print_blank(row_index, cell_index)
      if row_index.odd?
        print cell_index.odd? ? '   '.bg_blue : '   '.bg_white
      else
        print cell_index.even? ? '   '.bg_blue : '   '.bg_white
      end
    end

    def print_letter_legend
      puts '   a  b  c  d  e  f  g  h'.black
    end

    def print_row_num_before(row_index)
      print "#{8 - row_index} ".black
    end

    def print_row_num_after(row_index)
      puts " #{8 - row_index}".black
    end
  end
end
